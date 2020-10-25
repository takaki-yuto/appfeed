<template>
  <form @submit.prevent="updateForm">
    <textarea
      v-model="comment" 
      id="feedback_comment"
      placeholder="コメント入力"
      />
    <SubmitBtn />
  </form>
</template>

<script>
import SubmitBtn from '../Btns/Submit.vue'

export default {
  components: {
    SubmitBtn
  },
  props: {
    currentMsgId: {
      type: Number,
      default: null
    }
  },
  data () {
    return {
      comment: '',
      validMsg: ''
    }
  },
  mounted () {
    this.$nextTick(() => {
      if (this.currentMsgId) {
        const comments = this.$store.getters.comments
        const commentIndex = comments.findIndex((comment) => comment.id === this.currentMsgId)
        const commentText = comments[commentIndex].comment
        this.comment = commentText
      }
    })
  },
  methods: {
    updateForm(e) {
      if (this.comment !== '') {
        const eventTarget = e.currentTarget[1]
        eventTarget.disabled = true
        const id = this.currentMsgId
        const comment = this.comment
        this.$store.dispatch('asyncUpdateComment', { id, comment })
        this.comment = ''
        this.validMsg = ''
        this.$emit('send-update-event')
      } else {
        this.validMsg = 'コメントを入力してください'
      }
    },
  }
}
</script>

<style>
  .form {
    width: 100%;
  }
  .create-bottom {
    width: 100%;
    display: flex;
    justify-content: space-between;
  }
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