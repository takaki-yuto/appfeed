import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    submitEventStatus: false,
    comments: [],
    currentUserId: null
  },
  getters: {
    comments: state => state.comments,
    currentUserId: state => state.currentUserId,
    submitEventStatus: state => state.submitEventStatus
  },
  mutations: {
    changeSubmitStatus: (state, boolean) => {
      state.submitEventStatus = boolean;
    },
    getCurrentUserId: (state, id) => {
      state.currentUserId = id;
    },
    submitEvent: (state, boolean) => {
      state.submitEventStatus = boolean;
    },
    addComments: (state, array) => {
      state.comments = array.concat(state.comments);
    },
    updateComments: (state, obj) => {
      const msgId = obj.id;
      const getIndex = state.comments.findIndex((comment) => comment.id == msgId);
      state.comments.splice(getIndex, 1, obj);
    },
    removeComment: (state, { id, eventTarget }) => {
      const commentIndex = state.comments.findIndex((comment) => comment.id === id);
      state.comments.splice(commentIndex, 1);
      eventTarget.remove();
    }
  },
  actions: {
    asyncComment: ({ commit }, boolean) => {
      commit('changeSubmitStatus', boolean);
    },
    asyncCommentIndex: ({ commit }, postId) => {
      axios
      .get('/api/v1/feedbacks.json', {
        params: {
          postId,
        }
      })
      .then((response) => {
        if (response.data.feedbacks.length !== 0) {
          commit('addComments', response.data.feedbacks);
          commit('getCurrentUserId', response.data.currentUserId);
        }
      })
      .catch(() => {
        alert('エラー');
      });
    },
    asyncAddComment: ({ commit }, {postId, lastMessageId}) => {
      axios
      .get('/api/v1/feedbacks.json', {
        params: { postId, lastMessageId }
      })
      .then((response) => {
        if (response.data.feedbacks.length !== 0) {
          commit('addComments', response.data.feedbacks);
          commit('getCurrentUserId', response.data.currentUserId);
        }
      })
      .catch(() => {
        alert('エラー');
      });
    },
    asyncPostComment: ({ commit }, { postUrl, comment }) => {
      axios
        .post(postUrl, { comment })
        .then(() => {
          commit('submitEvent', true);
        })
        .catch(() => {
          alert('送信に失敗しました');
        });
    },
    asyncUpdateComment: ({ commit }, { id, comment }) => {
      const url = '/feedbacks/' + id;
      axios
        .put(url, { comment })
        .then((response) => {
          commit('updateComments', response.data.feedback);
        })
        .catch(() => {
          alert('更新に失敗しました');
        });
    },
    asyncRemoveComment: ({ commit }, { url, id, eventTarget }) => {
      axios
        .delete(url)
        .then(() => {
          commit('removeComment', { id, eventTarget });
      })
      .catch(() => {
        alert('削除に失敗しました');
      });
    }
  }
});
