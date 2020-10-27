<template>
  <div class="message-form">
    <div class="new-message">
      <div class="form-box">
        <CreateForm 
          v-if="showCreateForm"
        />
        <template
          v-else
        >
          <UpdateForm 
            :current-msg-id="currentMsgId"
            @send-update-event="recieveUpdateEvent"
          />
        </template>
      </div>
    </div>
  </div>
</template>

<script>
import CreateForm from './Create.vue';
import UpdateForm from './Update.vue';

export default {
  components: {
    CreateForm,
    UpdateForm
  },
  props: {
    currentMsgId: {
      type: Number,
      default: null
    }
  },
  data () {
    return {
      showCreateForm: false,
      showUpdateForm: false
    };
  },
  mounted() {
    this.$nextTick(() => {
      const createForm = this.$el.closest('.create-form');
      const updateForm = this.$el.closest('.update-form');
      if (createForm) {
        this.showCreateForm = true;
      } else if (updateForm) {
        this.showCreateForm = false;
        this.showUpdateForm = true;
      }
    });
  },
  methods: {
    recieveUpdateEvent () {
      this.$emit('resend-update-event');
    }
  }
};
</script>

<style scoped>
  .message-form {
    font-size: 25px;
    width: 80%;
    margin: 0 auto 10px;
  }
  .form-box {
    width: 100%;
  }

</style>