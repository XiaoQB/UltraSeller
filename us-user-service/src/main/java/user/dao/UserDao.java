package user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import user.domain.entity.User;
import user.mapper.UserMapper;

import java.util.List;
import java.util.Map;

@Repository
public class UserDao {

    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper){
        this.userMapper=userMapper;
    }

    //page为第一个参数，num为每页展示个数
    public List<Map<Object,Object>> getUserListPaging(int num, int page) {
         return userMapper.getUserListPaging(num,page);
    }
    public List<User> getUserListPaging1(int num, int page) {
        return userMapper.getUserListPaging1(num,page);
    }

    public String getTest(){
        return userMapper.getTest();
    }
}
