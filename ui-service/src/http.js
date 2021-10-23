import axios from 'axios';
import VueRouter from "vue-router";

// axios 配置
axios.defaults.timeout = 8000;


export const baseURL = {
    commodity:'http://localhost:8003/',
    user:'http://localhost:8002/'
}


// http request 拦截器
axios.interceptors.request.use(
    config => {
        if (localStorage.token) { //判断token是否存在
            config.headers.Authorization = localStorage.token;  //将token设置成请求头
        }
        return config;
    },
    err => {
        return Promise.reject(err);
    }
);

// http response 拦截器
axios.interceptors.response.use(
    response => {
        if (response.data.errno === 999) {
            VueRouter.replace('/');
            console.log("token过期");
        }
        return response;
    },
    error => {
        return Promise.reject(error);
    }
);
export default axios;
