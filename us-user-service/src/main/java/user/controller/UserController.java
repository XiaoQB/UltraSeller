package user.controller;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import user.domain.entity.User;
import user.result.R;
import user.result.ResultCode;
import user.service.impl.UserServiceImpl;
import user.utils.JwtUtil;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@Slf4j
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    //测试路由
    @GetMapping("/user/get")
    public R<String> forTest(String test){
        return new R<>(400,"message",test);
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

    @PostMapping("/user/register")
    public R<String> register(@RequestBody User user){
        if(user == null){
            log.info("user 参数为空");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(),null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), userService.insertUser(user));
    }

    @DeleteMapping("/user/logout")
    public R<String> register(String userName){
        if(userName == null){
            log.info("username 参数为空");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(),null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), userService.logout(userName));
    }

}
