package order.service.impl;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.enums.ResponseEntityCode;
import order.service.WalletService;

/**
 * @author beethoven
 * @date 2021-11-12 14:18:12
 */
public class WalletServiceFallbackImpl implements WalletService {

    @Override
    public ResponseEntity<String> changeBalance(String userName, double difference) {
        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), "钱包服务异常", null);
    }

}
