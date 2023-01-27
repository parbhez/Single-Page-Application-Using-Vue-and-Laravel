import axios from "axios";


export default {

    namespaced: true,

    state: {
        categories: [],
        myMessage: null,
        categoryForm: {
            id: '',
            category_name: ''
        },
        error: {
            validation_error: null,
            db_error: null,
        }
    },

    getters: {
        getCategories(state) {
            return state.categories;
        },
        totalCount(state) {
            return state.categories.total
        },
        sendMessage(state) {
            return state.myMessage;
        }
    },

    mutations: {
        getAllCategory(state, data) {
            state.categories = data.result;
        },
        setMessage(state, myMessage) {
            state.myMessage = myMessage;
        },
        clearMessage(state) {
            state.myMessage = null;
        },
    },

    actions: {
        async get_category({ commit }) {
            window.$eventBus.emit('loading-status', true);
            await axios.get("/category")
                .then((response) => {
                    commit('getAllCategory', response.data);
                    commit('setMessage', response.data);
                    window.$eventBus.emit('loading-status', false);
                    //console.log(response.data);
                })
                .catch((error) => {
                    commit('setMessage', error.response.statusText);
                    window.$eventBus.emit('loading-status', false);
                    console.log(error)
                })
        },

        clearMessage({ commit }) {
            commit('clearMessage')
        },

        async deleteCategory({ commit, dispatch }, category) {
            if (!window.confirm("Are You Sure ??")) {
                return;
            }
            await axios.get('/delete-category/' + category.id)
                .then((response) => {
                    commit('setMessage', response.data);
                    dispatch('get_category')
                })
                .catch((error) => {
                    commit('setMessage', error.response.statusText);
                    console.log(error)
                })
        },

        async removeCategory({ commit, dispatch }, category) {
            await axios.get('/delete-category/' + category.id)
                .then((response) => {
                    dispatch('get_category')
                    commit('setMessage', response.data);
                })
                .catch((error) => {
                    commit('setMessage', error.response.statusText);
                    console.log(error)
                })
        },
        async editCategory(context, category) {
            $("#exampleEditModal").modal('show');
            context.state.categoryForm.category_name = category.name;
            context.state.categoryForm.id = category.id;
        },
        async updateCategory(context, { vm }) {
            if (!context.state.categoryForm.category_name) {
                vm.$iziToast.error({
                    title: 'Opps..',
                    position: 'topRight',
                    message: "Category Field Can not be null",
                });
                return;
            }

            await axios.post('/update-category/' + context.state.categoryForm.id, context.state.categoryForm)
                .then((response) => {
                    context.dispatch('get_category')
                    context.commit('setMessage', response.data);
                    $("#exampleEditModal").modal('hide');
                    console.log(response.data)
                })
                .catch((error) => {
                    if (error.response.status === 422) {
                        context.state.error.validation_error = error.response.data.errors;
                        context.commit('setMessage', error.response.data.message);
                    } else {
                        context.commit('setMessage', error.response.statusText);
                    }
                    console.log(error)
                })
        }
    }








}