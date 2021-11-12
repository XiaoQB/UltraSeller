package cn.edu.fudan.user.service.impl;

import cn.edu.fudan.common.entities.dbo.User;
import cn.edu.fudan.common.entities.util.JwtUtil;
import cn.edu.fudan.user.service.UserService;
import com.alibaba.fastjson.JSON;

import com.alibaba.fastjson.JSONObject;
import io.jsonwebtoken.Claims;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.edu.fudan.user.dao.UserDao;

import java.util.*;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    @Override
    public String findByUsername(String userName, String password, String role) {
        User user = userDao.getUserByName(userName, role);
        if (user != null) {
            String pwd = DigestUtils.md5Hex(password);
            if (pwd.equals(user.getPassword())) {
                Map<String, Object> info = new HashMap<String, Object>();
                //jwt载荷选择
                info.put("role", role);
                info.put("success", "SUCCESS");
                info.put("username", userName);
                return JwtUtil.createJwt(UUID.randomUUID().toString(), JSON.toJSONString(info), null);
            }
            //设置令牌信息
        }
        return null;
    }

    @Override
    public Integer deleteUser(String role, String username) {
        return userDao.deleteUser(role, username);
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
    public Integer getUserNum(String role) {
        return userDao.getUserNum(role);
    }

    @Override
    public Integer modifyUser(Integer id, String role, String userName, String password, String phone, String email) {
        return userDao.modifyUser(id, role, userName, password, phone, email);
    }

    @Override
    public boolean authorization(String token, String role) {
        try {
            Claims claims = JwtUtil.parseJwt(token);
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
