var OSS = require('ali-oss');

let client = new OSS({
  region: 'oss-cn-shanghai',
  accessKeyId: 'LTAI5tRYvewmJkVJhK8buSB2',
  accessKeySecret: 'erZc6cZduyanBsJbASbGW2vZmseVEq',
  bucket: 'ultra-seller'
})  //后端提供数据


export const getFileNameUUID = () => {
  function rx() {
    return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
  }
  return `${+new Date()}_${rx()}${rx()}`
}
export const put = async (ObjName, fileUrl) => {
  try {
    let result = await client.put(`images/${ObjName}`, fileUrl)
    console.log(result)
    return result
  } catch (e) {
    console.log(e)
  }
}

