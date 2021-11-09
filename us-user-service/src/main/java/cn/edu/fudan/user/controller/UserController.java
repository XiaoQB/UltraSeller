package cn.edu.fudan.user.controller;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.User;
import cn.edu.fudan.user.result.ResultCode;
import cn.edu.fudan.user.service.CartService;
import cn.edu.fudan.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import cn.edu.fudan.user.domain.dto.GetUserListDTO;
import cn.edu.fudan.user.service.WalletService;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author beethoven
 */
@RestController
@Slf4j
@CrossOrigin(origins = "*", maxAge = 3600)
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private WalletService walletService;

    @Resource
    private CartService cartService;

    @GetMapping("/get")
    public ResponseEntity<String> forTest(String test) {
        return new ResponseEntity<>(400, "message", test);
    }

    @GetMapping("/login")
    public ResponseEntity<String> login(String userName, String password, String role) {
        if (StringUtils.isBlank(role)) {
            return new ResponseEntity<>(ResultCode.PERMISSION_NO_ACCESS.getCode(), ResultCode.PERMISSION_NO_ACCESS.getMessage(), null);
        }
        String jwt = userService.findByUsername(userName, password, role);
        if (StringUtils.isEmpty(jwt)) {
            return new ResponseEntity<>(ResultCode.LOGIN_FAIL.getCode(), ResultCode.LOGIN_FAIL.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), jwt);
    }

    @GetMapping("/info")
    public ResponseEntity<GetUserListDTO> getUserList(String role, Integer num, Integer page) {

        if (num == null || page == null) {
            log.info("info 查询数值错误");
            return new ResponseEntity<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        List<User> results = userService.getUserList(role, num, page);
        Integer userNum = userService.getUserNum(role);
        GetUserListDTO getUserListDTO = new GetUserListDTO(userNum, results);
        if (results == null) {
            return new ResponseEntity<>(ResultCode.QUERY_FAIL.getCode(), ResultCode.QUERY_FAIL.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), getUserListDTO);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Integer> deleteUser(@RequestBody User user) {
        String role = user.getRole();
        Integer id = user.getId();
        if (role == null || id == null) {
            log.info("info 删除数值错误");
            return new ResponseEntity<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        Integer deleteResult = userService.deleteUser(role, id);
        ResponseEntity<String> wallet_response = walletService.deleteWallet(user.getUserName());
        ResponseEntity<String> cart_response = cartService.deleteCart(user.getUserName());
        if (deleteResult == 0) {
            return new ResponseEntity<>(ResultCode.DELETE_FAIL.getCode(), ResultCode.DELETE_FAIL.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), deleteResult);
    }

    @PutMapping("/modify")
    public ResponseEntity<Integer> modifyUser(@RequestBody User user) {
        //id,role不能为null
        Integer id = user.getId();
        String role = user.getRole();
        String userName = user.getUserName();
        String password = user.getPassword();
        String phone = user.getPhone();
        String email = user.getEmail();

        if (id == null || role == null) {
            log.info("info 修改时数值错误");
            return new ResponseEntity<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        Integer modifyResult = userService.modifyUser(id, role, userName, password, phone, email);
        if (modifyResult == 0) {
            return new ResponseEntity<>(ResultCode.MODIFY_FAIL.getCode(), ResultCode.MODIFY_FAIL.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), modifyResult);

    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody User user) {
        if (user == null) {
            log.info("user 参数为空");
            return new ResponseEntity<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        boolean result = userService.insertUser(user);
        if (result) {

            ResponseEntity<String> wallet_response = walletService.createWallet(user);
            if (wallet_response.getCode() != 201) {
                userService.deleteUser(user.getRole(), user.getId());
                return wallet_response;
            }
            ResponseEntity<String> cart_response = cartService.createCart(user);
            if (cart_response.getCode() != 200) {
                walletService.deleteWallet(user.getUserName());
                userService.deleteUser(user.getRole(), user.getId());
                return cart_response;
            }

            return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.REGISTER_FAIL.getCode(), ResultCode.REGISTER_FAIL.getMessage(), null);
    }

    @DeleteMapping("/logout")
    public ResponseEntity<String> register(String userName) {
        if (userName == null) {
            log.info("username 参数为空");
            return new ResponseEntity<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), userService.logout(userName));

    }

}
