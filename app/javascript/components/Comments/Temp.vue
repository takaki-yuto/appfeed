<template>
  <div
    :data-message-id="comment.id"
  >
    <div 
      v-show="editStatus"
      class="message-innerbox"
    >
      <div class="user-icon">
        image
      </div>
      <div class="message-contents">
        <div class="upper-message">
          <div class="upper-message-left">
            <div class="user-name">
              {{ comment.name }}
            </div>
            <div class="date-time">
              {{ comment.created_at | moment('YYYY年MM月DD HH:mm') }}
            </div>
          </div>
          <div 
            v-if="currentUserId === comment.user_id" 
            class="upper-message-right"
          >
            <div class="right-box">
              <EditBtn
                :comment-id="comment.id"
                @send-edit-event="recieveEditEvent"
              />
              <br>
              <DestroyBtn 
                :comment-id="comment.id"
              />
            </div>
          </div>
        </div>
        <div class="lower-message">
          <div class="message-text">{{ comment.comment }}</div>
        </div>
      </div>
    </div>
    <template v-if="addCommentForm">
      <div class="return-btn-area">
        <a
          class="return-btn"
          @click="returnBtn"
        >戻る
        </a>
      </div>
      <div class="update-form">
        <SubmitForm 
          :current-msg-id="currentMsgId"
          @resend-update-event="recieveUpdateEvent" 
        />
      </div>
    </template>
  </div>
</template>

<script>
import moment from 'moment';
import SubmitForm from './Submit/Form.vue';
import DestroyBtn from './Btns/Destroy.vue';
import EditBtn from './Btns/Edit.vue';

export default {
  components: {
    EditBtn,
    DestroyBtn,
    SubmitForm
  },
  filters: {
    moment(value, format) {
      return moment(value).format(format);
    }
  },
  props: {
    currentUserId: {
      type: Number,
      default: null
    },
    comment: {
      type: Object,
      default: () => ({})
    },
  },
  data() {
    return {
      currentMsgId: null,
      editStatus: true,
      addCommentForm: false
    };
  },
  methods: {
    recieveEditEvent() {
      this.editStatus = false;
      this.addCommentForm = true;
      this.currentMsgId = Number(this.$el.dataset.messageId);
    },
    recieveUpdateEvent () {
      setTimeout(()=>{
        this.editStatus = true;
        this.addCommentForm = false;
      }, 60);
    },
    returnBtn() {
      this.editStatus = true;
      this.addCommentForm = false;
    }
  }
};
</script>

<style scoped>
  .return-btn-area {
    text-align: right;
  }
  a.return-btn {
    cursor: pointer;
  }
  .message-innerbox {
    width: 100%;
    display: flex;
    border-top: 1px solid rgba(209, 202, 202, 0.5);
    border-bottom: 1px solid rgba(209, 202, 202, 0.5);
    padding: 6px;
  }
  .user-icon {
    width: 10%;
  }
  .message-contents {
    width: 90%;
  }
  .upper-message {
    width: 100%;
    display: flex;
    justify-content: space-between
  }
  .upper-message-left {
    display: flex;
  }
  .upper-message-right {
    position: relative;
  }
  .right-box {
    width: 50px;
    display: block;
    position: absolute;
    left: -30px;
  }
  .user-name {
    font-size: 16px;
  }
  .date-time {
    margin-left: 5px;
    font-size: 12px;
    color: #999999;
  }
  .lower-message {
    display: block;
  }
  .message-text {
    font-size: 14px;
    white-space: pre-wrap;
    overflow-wrap: break-word;
  }
</style>