import { createStore } from 'vuex'
import categoryModule from './modules/category'

const store = createStore({
    modules: {
        category: categoryModule //categoryModule r namespace hoycce = category
    },

})

export default store