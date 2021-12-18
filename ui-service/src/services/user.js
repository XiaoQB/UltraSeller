const userUrl = '/api';

function getLists(name, ps, page) {
    var that = this;
    this.axios({
        headers: {
            'Content-Type': 'application/json;',
            'token': localStorage['token']
        },
        method: "get",
        url: `/api/seller/lists`,
        params: {
            role: "seller",
            name: name,
            ps: ps,
            page: page
        }
    })
        .then(function (response) {
            that.commodityList = response.data.items;
            that.dataTotalCount = response.data.total;
        })
        .catch(function (error) {
            that.$message({
                type: 'error',
                message: '系统异常：' + error
            });
        });
}

export default {
    getLists
}



