package user.controller;

import com.alibaba.fastjson.JSON;
import com.ctc.wstx.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
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
    public R<String> forTest(String test) {
        return new R<>(400, "message", test);
    }

    //测试token
    @GetMapping("/user/login")
    public R<String> login(String userName, String password, String role) {
         String  jwt = userService.findByUsername(userName,password,role);
        if(StringUtils.isEmpty(jwt)){
            return new R<>(ResultCode.LOGIN_FAIL.getCode(), ResultCode.LOGIN_FAIL.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), jwt);
    }

    @PostMapping("/user/register")
    public R<String> register(@RequestBody User user) {
        if (user == null) {
            log.info("user 参数为空");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        boolean result = userService.insertUser(user);
        if (result) {
            return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), null);
        }
        return new R<>(ResultCode.REGISTER_FAIL.getCode(), ResultCode.REGISTER_FAIL.getMessage(), null);
    }

    @DeleteMapping("/user/logout")
    public R<String> register(String userName) {
        if (userName == null) {
            log.info("username 参数为空");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), userService.logout(userName));
    }

}
