<template>
  <div class="container">
    <Navbar />
    <ChatWindow @connectCable="connectCable" :messages="formattedMessages" ref="chatWindow" />
    <NewChatForm @connectCable="connectCable" />
  </div>
</template>

<script>
import axios from 'axios'
import ActionCable from 'actioncable'
import { formatDistanceToNow } from 'date-fns'
import { ja } from 'date-fns/locale'
import Navbar from '../components/Navbar'
import NewChatForm from '../components/NewChatForm'
import ChatWindow from '../components/ChatWindow'

export default {
  components: { ChatWindow, Navbar, NewChatForm },
  data(){
    return{
      messages:[],
    }
  },
  computed: {
    formattedMessages () {
      if (!this.messages.length) { return [] }
      return this.messages.map(message => {
        let time = formatDistanceToNow(new Date(message.created_at), { locale: ja })
        return { ...message, created_at: time }
      })
    }
  },
  methods:{
    async getMessages(){
      try{
        const res = await axios.get(process.env.API_BASE_URL + '/messages',{
          headers:{
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client:window.localStorage.getItem('client')
          }
        })

        if(!res){
          new Error('メッセージ一覧を取得できませんでした')
        }
        this.messages = res.data
      }catch(err){
        console.log(err)
      }
    },
    connectCable (message) {
      this.messageChannel.perform('receive', {
        message: message,
        email: window.localStorage.getItem('uid')
      })
    }
  },
  mounted () {
    const cable = ActionCable.createConsumer('ws://'+ process.env.ACTION_CABLE_URL +'/cable')
    this.messageChannel = cable.subscriptions.create('RoomChannel', {
      connected: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      },
      received: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      }
    })
  },
  beforeUnmount () {
    this.messageChannel.unsubscribe()
  }
}
</script>

<style scoped>
</style>
