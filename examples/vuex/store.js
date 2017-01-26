import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)


const state = {
	url: '',
	base64: ''
}
const mutations = {
	base64(state, base64){
		state.base64 = base64
	}
}

const getters = {
	getURL: state => state.url,
	getBase64: state => state.base64
}

export default new Vuex.Store({
  state,
  getters,
  mutations
});
