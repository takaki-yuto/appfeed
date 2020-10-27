<template>
  <div class="form-bottom">
    <span class="valid-msg">{{ msg }}</span>
    <button 
      id="create-btn" 
      name="commit" 
      type="submit" 
    >
      送信
    </button>
  </div>
</template>

<script>
export default {
  props: {
    validMsg: {
      type: String,
      default: ''
    }
  },
  computed: {
    msg() {
      return this.validMsg;
    }
  }
};
</script>

<style scoped>
  .form-bottom {
    width: 100%;
    display: flex;
    justify-content: flex-end;
  }
  span.valid-msg {
    font-size: 16px;
    color: rgb(255, 0, 0);
  }
  #create-btn {
    width: 60px;
    height: 40px;
    margin-left: 10px;
    color: white;
    border: 1px solid #ccc;
    background-color: #38aef0;
  }
</style>
