package user.service.impl;

import com.alibaba.fastjson.JSON;

import com.alibaba.fastjson.JSONObject;
import common.JwtUtil;
import io.jsonwebtoken.Claims;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import user.dao.UserDao;
import user.domain.entity.User;
import user.service.UserService;
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
                System.out.println("token:" + JwtUtil.createJWT(UUID.randomUUID().toString(), JSON.toJSONString(info), null));
                return JwtUtil.createJWT(UUID.randomUUID().toString(), JSON.toJSONString(info), null);
            }
            //设置令牌信息
        }
        return null;
    }

    @Override
    public Integer deleteUser(String role, Integer id) {
        return userDao.deleteUser(role, id);
    }

    @Override
    public boolean insertUser(User user) {
        String password = DigestUtils.md5Hex(user.getPassword());
        return userDao.insertUser(user, password);
    }

    @Override
    public List<User> getUserList(String role, Integer num, Integer page) {
        page = (page - 1) * num;
        return userDao.getUserList(role, num, page);

    }

    @Override
    public Integer modifyUser(Integer id, String role, String userName, String password, String phone, String email) {
        return userDao.modifyUser(id, role, userName, password, phone, email);
    }

    @Override
    public boolean authorization(String token, String role) {
        try {
            Claims claims = JwtUtil.parseJWT(token);
            String subject = claims.getSubject();
            String tokenRole = JSONObject.parseObject(subject).getString("role");
            if (StringUtils.isNotBlank(role) && role.equals(tokenRole)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    @Override
    public String logout(String userName) {
        return null;
    }

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

}
