package cn.edu.fudan.user.service;

import cn.edu.fudan.user.domain.entity.User;
import cn.edu.fudan.user.result.R;
import cn.edu.fudan.user.service.impl.WalletServiceFallBackImpl;
import org.springframework.stereotype.Service;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author beethoven
 */
@FeignClient(value = "US-WALLET-SERVICE", fallback = WalletServiceFallBackImpl.class)
@RequestMapping("/wallet")
@Service
public interface WalletService {

    /**
     * 创建 wallet
     *
     * @param user user
     * @return string
     */
    @PostMapping("/user")
    R<String> createWallet(@RequestBody User user);

    /**
     * 删除 wallet
     *
     * @param userName userName
     * @return string
     */
    @DeleteMapping("/user")
    R<String> deleteWallet(@RequestParam("username") String userName);
}
