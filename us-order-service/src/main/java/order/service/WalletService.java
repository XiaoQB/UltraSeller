package order.service;

import cn.edu.fudan.common.entities.ResponseEntity;
import order.service.impl.WalletServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author beethoven
 * @date 2021-11-12 14:17:49
 */
@FeignClient(value = "us-wallet-service", fallback = WalletServiceFallbackImpl.class)
@Service
public interface WalletService {

    /**
     * 支付扣款
     *
     * @param userName   userName
     * @param difference difference
     * @return string
     */
    @PutMapping("/wallet/user")
    ResponseEntity<String> changeBalance(@RequestParam("username") String userName, @RequestParam("difference") double difference);

}
