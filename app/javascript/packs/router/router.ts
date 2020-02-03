import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import ArticleList from '../components/ArticleList.vue'
import RegisterContainer from "../container/RegisterContainer.vue"

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: "/", component: ArticlesContainer },
    { path: "/sign_up", component: RegisterContainer }
  ]
})