<template>
  <div >
    <div class="message-content">
      <div class="message-box">
        <IndexBox />
      </div>
    </div>
    <div class="create-form">
      <SubmitForm />
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import IndexBox from '../../components/Comments/Index.vue'
import SubmitForm from '../../components/Comments/Submit/Form.vue'
import TempComment from '../../components/Comments/Temp.vue'

const token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token

export default {
  components: {
    TempComment,
    IndexBox,
    SubmitForm
  },
}
</script>

<style scoped>
  .message-content {
    height: 500px;
    width: 550px;
    margin: 10px auto 10px;
    border-bottom: 1px solid rgba(169, 162, 162, 0.4);
    overflow: scroll;
    background-color: white;
    -ms-overflow-style: none; 
    scrollbar-width: none;
  }
  .message-content::-webkit-scrollbar {
    display: none;
  }
  .message-box {
    height: 50px;
    width: 530px;
    margin-bottom: 10px;
  }
</style>
