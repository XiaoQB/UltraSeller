package cn.edu.fudan.user.controller;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Cart;
import cn.edu.fudan.common.entities.dbo.User;
import cn.edu.fudan.common.entities.dbo.Wallet;
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
        /*
        if (num == null || page == null) {
            log.info("info 查询数值错误");
            return new ResponseEntity<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }

         */
        log.info("role:"+role);
        List<User> results = userService.getUserList(role, num, page);
        Integer userNum = userService.getUserNum(role);
        log.info("userNum:"+userNum);
        GetUserListDTO getUserListDTO = new GetUserListDTO(userNum, results);
        if (results == null) {
            return new ResponseEntity<>(ResultCode.QUERY_FAIL.getCode(), ResultCode.QUERY_FAIL.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), getUserListDTO);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Integer> deleteUser(@RequestBody User user) {
        String role = user.getRole();
        String username = user.getUserName();
        if (role == null || username == null) {
            log.info("info 删除数值错误");
            return new ResponseEntity<>(ResultCode.SERVICE_ERROR.getCode(), ResultCode.SERVICE_ERROR.getMessage(), null);
        }
        ResponseEntity<String> walletResponse = walletService.deleteWallet(user.getUserName());
        if (walletResponse.getCode() != 200) {
            return new ResponseEntity<>(ResultCode.DELETE_FAIL.getCode(), ResultCode.DELETE_FAIL.getMessage() + " 钱包服务删除失败", null);
        }
        /*
        ResponseEntity<String> cartResponse = cartService.deleteCart(user.getUserName());
        if (cartResponse.getCode() != 200) {
            return new ResponseEntity<>(ResultCode.DELETE_FAIL.getCode(), ResultCode.DELETE_FAIL.getMessage() + " 购物车服务删除失败", null);
        }

         */
        Integer deleteResult = userService.deleteUser(role, username);
        if (deleteResult == 0) {
            return new ResponseEntity<>(ResultCode.DELETE_FAIL.getCode(), ResultCode.DELETE_FAIL.getMessage(), null);
        }
        return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), deleteResult);
    }

    @PutMapping("/modify")
    public ResponseEntity<Integer> modifyUser(@RequestBody User user) {
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
        try {
            boolean result = userService.insertUser(user);
            if (result) {
                Wallet wallet = new Wallet(0L, user.getUserName(), 0.0, user.getRole());
                ResponseEntity<String> walletResponse = walletService.createWallet(wallet);
                if (walletResponse.getCode() != 201) {
                    userService.deleteUser(user.getRole(), user.getUserName());
                    return walletResponse;
                }
                user = userService.getUserByName(user.getRole(), user.getUserName());
                log.info("user id:"+user.getId());
                /*
                Cart cart = new Cart(user.getId().toString(), null);
                ResponseEntity<String> cartResponse = cartService.createCart(cart);
                if (cartResponse.getCode() != 200) {
                    walletService.deleteWallet(user.getUserName());
                    userService.deleteUser(user.getRole(), user.getUserName());
                    return cartResponse;
                }

                 */
                return new ResponseEntity<>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), null);
            }
            return new ResponseEntity<>(ResultCode.REGISTER_FAIL.getCode(), ResultCode.REGISTER_FAIL.getMessage(), null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(ResultCode.REGISTER_FAIL.getCode(), ResultCode.REGISTER_FAIL.getMessage() + " " + e.getMessage(), null);
        }
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
