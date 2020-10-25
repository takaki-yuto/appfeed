<template>
  <div class="message-form">
    <div class="new-message">
      <div class="input-box">
        <form @submit.prevent="submitBtn">
          <input 
            placeholder="コメント入力" 
            v-model="comment" 
            type="text" 
            id="feedback_comment"
          >
          <button 
            type="submit" 
            name="commit" 
            class="send-btn" 
          >送信</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

const token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token

export default {
  data() {
    return {
      comment: '',
    }
  },
  methods: {
    submitBtn(e) {
      const eventTarget = e.currentTarget[1]
      eventTarget.disabled = true
      let getPath = location.pathname;
      let postUrl = getPath + '/create/'
      const getUrl = getPath + '/create/feedbacks.json/'
      axios
        .post(postUrl, {
            comment: this.comment
        })
        .then((response) => {
          const sendComment = response.data
          this.$emit('sendSubmitEvent', sendComment)
          this.comment = ''
          eventTarget.disabled = false

        })
        .catch((error) => {
          alert('エラー')
        })
    }
  }
}
</script>

<style>
  .message-form {
    font-size: 25px;
    width: 80%;
    margin: 0 auto 10px;
  }
  .input-box {
    width: 100%;
  }
  .text {
    width: 63%;
    border: 1px solid #ccc;
    color: #434a54;
    height: 50px;
    padding: 0px 40px 0px 10px;
  }
  .send-btn {
    width: 100px;
    height: 50px;
    margin-left: 10px;
    color: white;
    border: 1px solid #ccc;
    background-color: #38aef0;
  }

</style>