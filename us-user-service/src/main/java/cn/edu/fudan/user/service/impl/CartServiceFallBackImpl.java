package cn.edu.fudan.user.service.impl;

import cn.edu.fudan.user.result.R;
import cn.edu.fudan.user.service.CartService;
import cn.edu.fudan.user.domain.entity.User;

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
