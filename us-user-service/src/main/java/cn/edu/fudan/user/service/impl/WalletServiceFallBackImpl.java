package cn.edu.fudan.user.service.impl;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.User;
import cn.edu.fudan.common.entities.dbo.Wallet;
import cn.edu.fudan.common.entities.enums.ResponseEntityCode;
import cn.edu.fudan.common.entities.enums.ResponseEntityMessage;
import cn.edu.fudan.user.service.WalletService;

/**
 * @author beethoven
 * @date 2021-11-09 21:46:40
 */
public class WalletServiceFallBackImpl implements WalletService {

    @Override
    public ResponseEntity<String> createWallet(Wallet wallet) {
        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + "钱包服务异常", null);
    }

    @Override
    public ResponseEntity<String> deleteWallet(String userName) {
        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + "钱包服务异常", null);
    }

}
