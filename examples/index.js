import Vue from 'vue'
import VueRouter from 'vue-router'
import store from './vuex/store'
import App from './pages/App.vue'
import routes from './route.config.js'
import './Common/styles/index.scss'
import 'weui/dist/style/weui.css'

Vue.use(VueRouter)
const router = new VueRouter({
  linkActiveClass: 'active',
  base: __dirname,
  routes
})
Vue.mixin({
  methods: {
    analytics(track_name, ops = {}){
      const _DEFAULT = {App: 'H5'}
      window.analytics.track(track_name, Object.assign(_DEFAULT, ops))
    },
  }
})

new Vue({ // eslint-disable-line
  render: h => h(App),
  router,
  store
}).$mount('#app');
