package user.service;

import org.apache.ibatis.annotations.Delete;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import user.domain.entity.User;
import user.result.R;
import user.service.impl.CartServiceFallBackImpl;

/**
 * @author beethoven
 * @date 2021-11-09 21:32:29
 */
@RequestMapping("/cart")
@Service
@FeignClient(value = "US_CART_SERVICE", fallback = CartServiceFallBackImpl.class)
public interface CartService {

    /**
     * 删除 cart
     *
     * @param userName userName
     * @return string
     */
    @Delete("")
    R<String> deleteCart(String userName);

    /**
     * 创建 cart
     *
     * @param user user
     * @return string
     */
    @PostMapping("")
    R<String> createCart(User user);
}
