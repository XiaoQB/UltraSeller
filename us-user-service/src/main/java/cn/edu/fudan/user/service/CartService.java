package cn.edu.fudan.user.service;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Cart;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.edu.fudan.user.service.impl.CartServiceFallBackImpl;

/**
 * @author beethoven
 * @date 2021-11-09 21:32:29
 */
@RequestMapping("/testapp/shopcar")
@Service
@FeignClient(value = "us-cart-service", fallback = CartServiceFallBackImpl.class)
public interface CartService {

    /**
     * 删除 cart
     *
     * @param userName userName
     * @return string
     */
    @DeleteMapping("/test")
    ResponseEntity<String> deleteCart(String userName);

    /**
     * 创建 cart
     *
     * @param Cart cart
     * @return string
     */
    @PostMapping("/AddCart")
    ResponseEntity<String> createCart(Cart cart);
}
