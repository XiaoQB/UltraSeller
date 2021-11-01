package wallet.controller;

import org.springframework.web.bind.annotation.*;
import wallet.domain.Deal;
import wallet.utils.Response;

/**
 * @author tristonk
 */
@RestController
public class WalletController {

    /*
    * 成功：201
    * 失败：
    *   重复：409
    *   不知为何失败：404
    * */
    @PostMapping("/wallet/user")
    public Response<String> createWallet(@RequestParam("username") String userName){
        return null;
    }

    /*
     * 成功：200
     * 失败：401 (token错误) 404（其他错误）
     * */
    @PutMapping("/wallet/user")
    public Response<String> changeBalance(@RequestHeader("token") String token,
                                          @RequestParam("username") String userName,
                                          @RequestParam("difference") long difference){
        return null;
    }

    /*
     * 成功：200
     * 失败：404
     * */
    @DeleteMapping("/wallet/user")
    public Response<String> deleteWallet(@RequestParam("username") String userName){
        return null;
    }


    /*
    * 成功：200
    * 失败：404
    * */
    @PutMapping("/wallet/deal")
    public Response<String> handleDeal(@RequestHeader("token") String token, @RequestBody Deal deal){
        return null;
    }
}
