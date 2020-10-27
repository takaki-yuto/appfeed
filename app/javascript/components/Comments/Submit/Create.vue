<template>
  <form @submit.prevent="createForm">
    <textarea
      id="feedback_comment" 
      v-model="comment"
    />
    <SubmitBtn 
      :valid-msg="validMsg"
    />
  </form>
</template>

<script>
import SubmitBtn from '../Btns/Submit.vue';

export default {
  components: {
    SubmitBtn
  },
  data () {
    return {
      comment: '',
      validMsg: ''
    };
  },  
  methods: {
    createForm(e) {
      if (this.comment !== '') {
        const eventTarget = e.currentTarget[1];
        eventTarget.disabled = true;
        const getPath = location.pathname;
        const postUrl = getPath + '/feedbacks/';
        const comment = this.comment;
        this.$store.dispatch('asyncPostComment', { postUrl, comment });
        this.comment = '';
        this.validMsg = '';
      } else {
        this.validMsg = 'コメントを入力してください';
      }
    },
  }
};
</script>

<style>
  textarea {
    height: 100px;
    width: calc(100% - 16px);
    max-height: 500px;
    min-height: 100px;
    font-size: 17px;
    resize: vertical;
    padding: 8px;
  }

</style>