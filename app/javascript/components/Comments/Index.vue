<template>
  <div>
    <TempComment 
      v-for="comment in comments" 
      :key="comment.id" 
      :comment="comment"
      :current-user-id="currentUserId"
    />
  </div>
</template>

<script>
import TempComment from '../Comments/Temp.vue'

export default {
  components: {
    TempComment
  },
  computed: {
    comments () {
      return this.$store.getters.comments
    },
    currentUserId () {
      return this.$store.getters.currentUserId
    }
  },
  mounted () {
    this.$nextTick(() => {
      const postId = this.$el.closest('.main').dataset.apppostId
      this.$store.dispatch('asyncCommentIndex', postId)
    }),
    this.$store.watch(
      (state, getters) => getters.submitEventStatus,
      (newValue, olodValue) => {
        if (newValue === true) {
          const postId = this.$el.closest('.main').dataset.apppostId
          if ( this.$el.children.length !== 0 ) {
            const lastMessageId = this.$el.firstElementChild.dataset.messageId
            this.$store.dispatch('asyncAddComment', { postId, lastMessageId})
            this.$store.commit('submitEvent', false)
          } else {
            this.$store.dispatch('asyncCommentIndex', postId)
            this.$store.commit('submitEvent', false)
          }
        }
        // const lastMessagePosition = this.$el.firstElementChild.getBoundingClientRect().top
        // debugger
        // scrollToTop: () => scrollTo(0, lastMessagePosition)
        const getSendBtn = document.getElementById('create-btn')
        getSendBtn.disabled = false
      }
    ),
    setInterval(() => {
      const postId = this.$el.closest('.main').dataset.apppostId
      if ( this.$el.children.length !== 0 ) {
        const lastMessageId = this.$el.firstElementChild.dataset.messageId
        this.$store.dispatch('asyncAddComment', { postId, lastMessageId })
      } else {
        this.$store.dispatch('asyncCommentIndex', postId)
      }
    }, 1000000)
  },
}
</script>
