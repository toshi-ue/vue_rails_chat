<template>
  <div class="container welcome">
    <p>うぇるかむ!!</p>
    <div v-if="shouldShowLoginForm">
      <LoginForm @redirectToChatRoom="redirectToChatRoom"/>
      <p class="change-form">初めての方は<span @click="shouldShowLoginForm = false">こちら</span>をクリック</p>
    </div>
    <div v-if="!shouldShowLoginForm">
      <SignupForm @redirectToChatRoom="redirectToChatRoom"/>
      <p class="change-form">初めての方は<span @click="shouldShowLoginForm = false">こちら</span>をクリック</p>
    </div>
  </div>
</template>

<script>
import LoginForm from '../components/LoginForm'
import SignupForm from '../components/SignupForm.vue'

export default{
  components: { LoginForm, SignupForm },
  data(){
    return{
      shouldShowLoginForm: true
    }
  },
  methods: {
    redirectToChatRoom () {
      this.$router.push({ name: 'Chatroom' })
    }
  }
}
</script>

<style>
  .welcome {
    text-align: center;
    padding: 20px 0;
  }

  /*  ======= 👇 ここから追加する ======= */
  .welcome form {
    width: 300px;
    margin: 20px auto;
  }
  .welcome label {
    display: block;
    margin: 20px 0 10px;
  }
  .welcome input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px auto;
    border-radius: 4px;
    border: 1px solid #eee;
    outline: none;
    box-sizing: border-box;
  }
  .welcome span{
    font-weight: bold;
    text-decoration: underline;
    cursor: pointer;
  }
  .welcome button {
    margin: 20px auto;
  }
  .change-form {
    font-size: 14px;
    margin: 10px;
  }
</style>
