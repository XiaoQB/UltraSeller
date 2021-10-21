package user.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import user.domain.entity.User;
import user.result.R;
import user.result.ResultCode;
import user.service.impl.UserServiceImpl;
<<<<<<< HEAD
import user.utils.JwtUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
=======
>>>>>>> d394d3fa5bc22346c3690a40d49c6f2b5382ead3

@RestController
@Slf4j
public class UserController {

    private UserServiceImpl userServiceImpl;

    //测试路由
    @GetMapping("/user/get")
    public R<String> forTest(String test) {
        return new R<>(400, "message", test);
    }

    //测试token
    @GetMapping("/user/login")
    public R<String> login(String userName, String password, String role) {
        String jwt = userService.findByUsername(userName, password, role);
        if (StringUtils.isEmpty(jwt)) {
            return new R<>(ResultCode.LOGIN_FAIL.getCode(), ResultCode.LOGIN_FAIL.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), jwt);
    }

<<<<<<< HEAD
    @GetMapping("/userInfo/buyer")
    public List<Map<Object,Object>> getUserListPaging(@RequestParam(value = "num",defaultValue = "0") String numString,
                                        @RequestParam(value = "page",defaultValue = "1") String pageString){
        System.out.println(numString+"              "+pageString);
        int num= Integer.valueOf(numString);
        int page=Integer.valueOf(pageString);
        List<Map<Object,Object>> users=userServiceImpl.getUserListPaging(num,page);
        return users;
    }

    @GetMapping("/userInfo/buyer1")
    public List<User> getUserListPaging1(@RequestParam(value = "num",defaultValue = "0") String numString,
                                                      @RequestParam(value = "page",defaultValue = "1") String pageString){
        System.out.println(numString+"              "+pageString);
        int num= Integer.valueOf(numString);
        int page=Integer.valueOf(pageString);
        List<User> users=userServiceImpl.getUserListPaging1(num,page);
        System.out.println("              "+users.get(0).getUserName());
        return users;
    }

=======
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
>>>>>>> d394d3fa5bc22346c3690a40d49c6f2b5382ead3

    @DeleteMapping("/user/logout")
    public R<String> register(String userName) {
        if (userName == null) {
            log.info("username 参数为空");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), userService.logout(userName));
    }

    @GetMapping("/test")
    public String getTest(){
        String result=userServiceImpl.getTest();
        return result;
    }

    @Autowired
    public void setUserServiceImpl(UserServiceImpl userServiceImpl){
        this.userServiceImpl=userServiceImpl;
    }

}
