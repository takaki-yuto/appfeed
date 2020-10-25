<template>
  <TempComment />
</template>

<script>
import TempComment from '../Comments/Temp.vue'
  export default {
    components: {
      TempComment
    },
    data() {
      return {
        appPostId: null,
        comments: [],
        currentId: null
      };
    },
    methods: {

    },
  };
</script>
