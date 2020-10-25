<template>
  <a
    rel="nofollow"
    @click="editComment"
    >
    編集
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
    editComment() {
      this.$emit('send-edit-event')
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