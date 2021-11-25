package cn.edu.fudan.user.service.impl;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Cart;
import cn.edu.fudan.common.entities.enums.ResponseEntityCode;
import cn.edu.fudan.common.entities.enums.ResponseEntityMessage;
import cn.edu.fudan.user.service.CartService;

/**
 * @author beethoven
 * @date 2021-11-09 21:36:10
 */
public class CartServiceFallBackImpl implements CartService {

    @Override
    public ResponseEntity<String> deleteCart(String userName) {
        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + "购物车服务异常", null);
    }

    @Override
    public String createCart(Cart cart) {
        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + "购物车服务异常", null).toString();
    }
}
