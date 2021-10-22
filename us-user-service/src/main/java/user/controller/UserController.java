package user.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import user.domain.entity.User;
import user.service.impl.UserServiceImpl;
import user.utils.JwtUtil;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    //测试路由
    @GetMapping("/user/get")
    public String forTest(){
        return "user route test";
    }

    //测试token
    @GetMapping("/user/login")
    public String login(String userName,String password,String role){
        //User user = userService.findByUsername(userName);

        //密码解密正确
        //if(user!=null && BCrypt.checkpw(password,user.getPassword())){
            //设置令牌信息
            Map<String,Object> info = new HashMap<String,Object>();
            //jwt载荷选择
            info.put("role",role);
            info.put("success","SUCCESS");
            info.put("username",userName);
            //生成令牌
            String jwt = JwtUtil.createJWT(UUID.randomUUID().toString(), JSON.toJSONString(info),null);

            return jwt;
        //}
       // return  "账号或者密码错误";
    }



}
