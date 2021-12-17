<template>
  <div>
    <h1>{{ title }}</h1>
    <TestComponent @toggle="toggle" message="コンポーネントにデータが渡されています"/>
    <p v-if="isEnabled">こんにちは</p>
  </div>
</template>

<script>
import TestComponent from '../components/TestComponent.vue'

export default{
  components:{
    TestComponent
  },
  data(){
    return{
      title: '初めてのVue.jsあぷり',
      subtitle: 'ようこそ',
      isEnabled: true
    }
  },
  computed: {
    text () {
      if (this.isEnabled) {
        return 'こんにちは！'
      } else {
        return 'さよなら！'
      }
    }
  },
  methods: {
    toggle () {
      this.isEnabled = !this.isEnabled
    }
  }
}
</script>
