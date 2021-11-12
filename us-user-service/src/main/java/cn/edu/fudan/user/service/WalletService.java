package cn.edu.fudan.user.service;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Wallet;
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
@FeignClient(value = "us-wallet-service", fallback = WalletServiceFallBackImpl.class)
@RequestMapping("/wallet")
@Service
public interface WalletService {

    /**
     * 创建 wallet
     *
     * @param wallet wallet
     * @return string
     */
    @PostMapping("/user")
    ResponseEntity<String> createWallet(@RequestBody Wallet wallet);

    /**
     * 删除 wallet
     *
     * @param userName userName
     * @return string
     */
    @DeleteMapping("/user")
    ResponseEntity<String> deleteWallet(@RequestParam("username") String userName);
}
