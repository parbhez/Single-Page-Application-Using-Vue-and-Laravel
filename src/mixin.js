export default {
    methods: {
        successMessage(data) {
            this.$iziToast.success({
                title: 'Ok',
                position: 'topCenter', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter, center
                message: data.msg,
            });
        },

        validationError(data) {
            this.$iziToast.error({
                title: 'Opps..',
                position: 'topRight',
                message: data.msg,
            });
        },

        errorMessage(data) {
            this.$iziToast.error({
                title: 'Opps..',
                position: 'topRight',
                message: data.msg,
            });
        },

        serverError(message) {
            this.$iziToast.error({
                title: 'Opps..',
                position: 'topCenter',
                message: message,
            });
        }
    }
}