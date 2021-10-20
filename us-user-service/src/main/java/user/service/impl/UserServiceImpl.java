package user.service.impl;

import com.alibaba.fastjson.JSON;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import user.dao.UserDao;
import user.domain.entity.User;
import user.mapper.UserMapper;
import user.service.UserService;
import user.utils.JwtUtil;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public String findByUsername(String userName,String password,String role) {
        User user = userDao.getUserbyName(userName,role);
        if (user != null ) {
            String pwd = BCrypt.hashpw(password,BCrypt.gensalt());
            boolean checkpw = BCrypt.checkpw(pwd, password);
            if(checkpw){
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
    public boolean insertUser(User user) {
        String password = BCrypt.hashpw(user.getPassword(),BCrypt.gensalt());
        return userDao.insertUser(user,password);
    }

    @Override
    public String logout(String userName) {
        return null;
    }
}
