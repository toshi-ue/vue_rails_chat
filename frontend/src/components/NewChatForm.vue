<template>
  <form>
    <textarea
      placeholder="メッセージを入力してEnterを押してください"
      v-model="message"
    ></textarea>
  </form>
</template>

<script>
export default {
  data () {
    return {
      message: ''
    }
  }
}
</script>

<style scoped>
  form {
    margin: 10px;
  }
  textarea {
    width: 100%;
    max-width: 100%;
    margin-bottom: 6px;
    padding: 10px;
    box-sizing: border-box;
    border: 0;
    border-radius: 20px;
    font-family: inherit;
    outline: none;
  }
</style>
