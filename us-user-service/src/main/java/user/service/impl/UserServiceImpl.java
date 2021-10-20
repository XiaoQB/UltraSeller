package user.service.impl;

import com.alibaba.fastjson.JSON;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import user.dao.UserDao;
import user.domain.entity.User;
import user.service.UserService;
import user.utils.JwtUtil;

import java.util.*;

import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public String findByUsername(String userName, String password, String role) {
        User user = userDao.getUserbyName(userName, role);
        if (user != null) {
            String pwd = DigestUtils.md5Hex(password);
            if (pwd.equals(user.getPassword())) {
                Map<String, Object> info = new HashMap<String, Object>();
                //jwt载荷选择
                info.put("role", role);
                info.put("success", "SUCCESS");
                info.put("username", userName);
                //生成令牌
                return JwtUtil.createJWT(UUID.randomUUID().toString(), JSON.toJSONString(info), null);
            }
            //设置令牌信息
        }
        return null;
    }

    @Override
    public Integer deleteUser(String role,String username){
        return userDao.deleteUser(role,username);
    }

    @Override
    public boolean insertUser(User user) {
        String password = DigestUtils.md5Hex(user.getPassword());
        return userDao.insertUser(user, password);
    }

    @Override
    public List<User> getUserList(String role,Integer num,Integer page){
        page=(page-1)*num;
        return userDao.getUserList(role,num,page);

    }

    @Override
    public String logout(String userName) {
        return null;
    }


    @Autowired
    public void setUserDao(UserDao userDao){
        this.userDao=userDao;
    }

}
