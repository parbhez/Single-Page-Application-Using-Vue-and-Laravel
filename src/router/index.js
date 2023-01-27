import { createRouter, createWebHistory } from 'vue-router'

const routes = [

    {
        path: '/',
        name: 'home',
        component: () =>
            import ('../views/Home.vue')
    },

    {
        path: '/category',
        name: 'category',
        component: () =>
            import ('../components/category/TheCategory.vue')
    },

    {
        path: '/product',
        name: 'product',
        component: () =>
            import ('../components/product/TheProduct.vue')
    },




]

const allRouterPath = createRouter({
    history: createWebHistory(),
    routes,
})

export default allRouterPath