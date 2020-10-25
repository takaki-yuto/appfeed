import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    commentComponents: [],
    commentList: [],
    commentObj: {
      id: null,
      comment: '',
      userId: null,
      created_at: null, 
      updated_at: null,
    },
    currentUserId: null,
    appPostId: null,

  },
  mutations: {
    addCommentComponent(state, commentTemp) {
      
    }
  }
})
