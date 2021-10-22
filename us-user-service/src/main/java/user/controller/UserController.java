package user.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import user.domain.dto.GetUserListDTO;
import user.domain.dto.ModifyDTO;
import user.domain.entity.User;
import user.result.R;
import user.result.ResultCode;
import user.service.UserService;
import java.util.List;

@RestController
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;

    //测试路由
    @GetMapping("/user/get")
    public R<String> forTest(String test) {
        return new R<>(400, "message", test);
    }

    //测试token
    @GetMapping("/user/login")
    public R<String> login(String userName, String password, String role) {
        if(StringUtils.isBlank(role)){
            return new R<>(ResultCode.PERMISSION_NO_ACCESS.getCode(),ResultCode.PERMISSION_NO_ACCESS.getMessage(),null);
        }
        String jwt = userService.findByUsername(userName, password, role);
        if (StringUtils.isEmpty(jwt)) {
            return new R<>(ResultCode.LOGIN_FAIL.getCode(), ResultCode.LOGIN_FAIL.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), jwt);
    }

    @GetMapping("/user/info")
    public R<List<User>> getUserList(@RequestBody GetUserListDTO getUserListDTO){
        Integer num=getUserListDTO.getNum();
        Integer page=getUserListDTO.getPage();
        String role=getUserListDTO.getRole();
        if(num==null||page==null){
            log.info("info 查询数值错误");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        List<User> results = userService.getUserList(role,num,page);
        if(results==null){
            return new R<>(ResultCode.QUERY_FAIL.getCode(), ResultCode.QUERY_FAIL.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), results);
    }

    @DeleteMapping("/user/delete")
    public R<Integer> deleteUser(@RequestBody User user){
        String role=user.getRole();
        String username=user.getUserName();
        if(role==null||username==null){
            log.info("info 删除数值错误");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        Integer deleteResult = userService.deleteUser(role,username);
        if(deleteResult==0){
            return new R<>(ResultCode.DELETE_FAIL.getCode(), ResultCode.DELETE_FAIL.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), deleteResult);
    }

    @PutMapping("/user/modify")
    public R<Integer> modifyUser(@RequestBody ModifyDTO modifyDTO){
        String userName=modifyDTO.getUserName();
        String newData=modifyDTO.getNewData();
        String role=modifyDTO.getRole();
        String type=modifyDTO.getType();
        if(userName==null||newData==null||role==null){
            log.info("info 修改时数值错误");
            return new R<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        Integer modifyResult=userService.modifyUser(userName,newData,type,role);
        if(modifyResult==0){
            return new R<>(ResultCode.MODIFY_FAIL.getCode(), ResultCode.MODIFY_FAIL.getMessage(), null);
        }
        return new R<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), modifyResult);

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
