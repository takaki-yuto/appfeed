<template>
  <a  
    rel="nofollow" 
    @click="destroyComment" 
    >
    削除
  </a>
</template>

<script>
export default {
  props: {
    commentId: {
      type: Number,
      default: null
    }
  },
  methods: {
    destroyComment() {
      const getCommentId = this.commentId
      const removeTarget = this.$el.closest('.message-innerbox')
      const url = '/feedbacks/' + getCommentId
      this.$store.dispatch('asyncRemoveComment', { url, id: getCommentId,  eventTarget: removeTarget })
    }
  }
}
</script>

<style scoped>
  a {
    font-size: 15px;
    cursor: pointer;
  }
</style>