import Vue from 'vue'
import store from '../store/index.js'

import CommentArea from '../modules/Comments/Comment.vue'

document.addEventListener('DOMContentLoaded', () => {
  const commentArea = new Vue({
    store,
    el: '#commentAreaVue',
    render: h => h(CommentArea)
  });
  return commentArea
})