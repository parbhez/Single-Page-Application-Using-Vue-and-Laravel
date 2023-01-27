//import axios from "axios";

// export default axios.create({
//     baseURL: "http://localhost:8080/api",
//     headers: {
//       "Content-type": "application/json"
//     }
//   });

// const http = axios.create({
//     base_url: 'http://localhost/vue-spa/laravel-app/api',
//     headers: {
//         "Content-type": "application/json"
//     },
// })

// export default http


//=============================2nd Option ===================================

import axios from 'axios'
window.axios = axios
axios.defaults.baseURL = 'http://localhost/vue-spa/laravel-app/api'