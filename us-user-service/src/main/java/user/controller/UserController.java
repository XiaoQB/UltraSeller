package user.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import user.domain.entity.User;
import user.service.impl.UserServiceImpl;
import user.utils.JwtUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
public class UserController {

    private UserServiceImpl userServiceImpl;

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
