package cn.edu.fudan.user.service.impl;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.User;
import cn.edu.fudan.user.service.CartService;

/**
 * @author beethoven
 * @date 2021-11-09 21:36:10
 */
public class CartServiceFallBackImpl implements CartService {

    @Override
    public ResponseEntity<String> deleteCart(String userName) {
        return null;
    }

    @Override
    public ResponseEntity<String> createCart(User user) {
        return null;
    }
}
