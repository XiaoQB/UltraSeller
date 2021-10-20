package user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import user.dao.UserDao;
import user.domain.entity.User;
import user.service.UserService;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Override
    public User findByUsername(String userName) {
        return null;
    }

    @Override
    public List<Map<Object,Object>> getUserListPaging(int num, int page){
        page=(page-1)*num;
        return userDao.getUserListPaging(num,page);
    }
    @Override
    public String getTest(){
        return userDao.getTest();
    }

    @Autowired
    public void setUserDao(UserDao userDao){
        this.userDao=userDao;
    }

}
