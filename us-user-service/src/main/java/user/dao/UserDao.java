package user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import user.domain.entity.User;
import user.mapper.UserMapper;
import user.utils.DBUtils;

import java.io.IOException;
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
        SqlSession sqlSession = null;
        List<Map<Object,Object>> userList=null;
        try {
            sqlSession = DBUtils.openSqlSession();
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            userList = userMapper.getUserListPaging(num,page);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            sqlSession.rollback();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return userList;
    }

    public String getTest(){
        SqlSession sqlSession = null;
        String res = "";
        try {
            sqlSession = DBUtils.openSqlSession();
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            res = userMapper.getTest();
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            sqlSession.rollback();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return res;
    }
}
