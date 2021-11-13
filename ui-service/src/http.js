import axios from 'axios';


// axios 配置
axios.defaults.baseURL = "/api";


export const baseURL = {
    commodity: 'http://localhost:8003',
    user: 'http://localhost:8002',
    gateway:'http://localhost:8000'
}

export default axios;
