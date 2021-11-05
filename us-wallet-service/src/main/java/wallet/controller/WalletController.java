package wallet.controller;

import org.springframework.web.bind.annotation.*;
import wallet.domain.Deal;
import wallet.domain.Wallet;
import wallet.service.impl.WalletServiceImpl;
import wallet.utils.IdGenerator;
import wallet.utils.JwtUtil;
import wallet.utils.Response;

import java.util.Objects;

/**
 * @author tristonk
 */
@RestController
public class WalletController {

    private WalletServiceImpl walletService;

    @PostMapping("/wallet/user")
    public Response<String> createWallet(@RequestBody Wallet wallet){
        wallet.setWalletId(Long.parseLong(IdGenerator.generateId()));
        int ret = walletService.create(wallet);
        if(ret == -1){
            return new Response<>(409, "用户已存在", null);
        } else if(ret == 0){
            return new Response<>(201, "创建成功", null);
        } else {
            return new Response<>(404, "未知原因出错", null);
        }
    }

    @PutMapping("/wallet/user")
    public Response<String> changeBalance(@RequestHeader("token") String token,
                                          @RequestParam("username") String userName,
                                          @RequestParam("difference") double difference){
        if(Objects.equals(JwtUtil.getRole(token), "admin") || Objects.equals(JwtUtil.getUserName(token), userName)){
            int ret = walletService.update(userName, difference);
            if(ret == -1){
                return new Response<>(404, "用户错误", null);
            }
            return new Response<>(200, "更新成功", null);
        }
        return new Response<>(401, "权限不足", null);
    }

    @DeleteMapping("/wallet/user")
    public Response<String> deleteWallet(@RequestParam("username") String userName){
        int ret = walletService.delete(userName);
        if(ret == -1){
            return new Response<>(404, "用户信息错误", null);
        }
        return new Response<>(200, "更新成功", null);
    }

    @PutMapping("/wallet/deal")
    public Response<String> handleDeal(@RequestHeader("token") String token, @RequestBody Deal deal){
        String status = deal.getDealStatus();
        int ret = 0;
        if(Objects.equals(status, "pending")){
            ret = walletService.update(deal.getBuyerName(), deal.getPrice());
        } else if(Objects.equals(status, "finish")){
            ret = walletService.update(deal.getSellerName(), deal.getPrice());
        }
        if(ret == -1){
            return new Response<>(404, "更新错误", null);
        }
        return new Response<>(200, "处理成功", null);
    }

    @GetMapping("/wallet/user")
    public Response<Wallet> getWallet(@RequestParam("username") String userName){
        return new Response<>(200, "", walletService.get(userName));
    }
}
