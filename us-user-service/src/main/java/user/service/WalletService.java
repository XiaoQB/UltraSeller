package user.service;

import user.result.R;
import user.domain.entity.*;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "user-wallet-service")
@Service
@RequestMapping("/wallet")
public interface WalletService {

    @PostMapping("/user")
    R<String> createWallet(@RequestBody User user);

    @DeleteMapping("/user")
    public R<String> deleteWallet(@RequestParam("username") String userName);

}
