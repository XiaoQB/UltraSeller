package user.service.impl;

import user.domain.entity.User;
import user.result.R;
import user.service.CartService;

/**
 * @author beethoven
 * @date 2021-11-09 21:36:10
 */
public class CartServiceFallBackImpl implements CartService {

    @Override
    public R<String> deleteCart(String userName) {
        return null;
    }

    @Override
    public R<String> createCart(User user) {
        return null;
    }
}
