package wallet.controller;

import cn.edu.fudan.common.entities.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import wallet.domain.Deal;
import wallet.domain.Wallet;
import wallet.domain.WalletRecord;
import wallet.service.impl.WalletServiceImpl;
import wallet.utils.IdGenerator;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * The type Wallet controller.
 *
 * @author tristonk
 */
@RestController
public class WalletController {

    @Resource
    private WalletServiceImpl walletService;

    /**
     * Create wallet response.
     *
     * @param wallet the wallet
     * @return the response
     */
    @PostMapping("/wallet/user")
    public ResponseEntity<String> createWallet(@RequestBody Wallet wallet) {
        wallet.setWalletId(Long.parseLong(IdGenerator.generateId()));
        int ret = walletService.create(wallet);
        if (ret == -1) {
            return new ResponseEntity<>(409, "用户已存在", null);
        } else if (ret == 0) {
            return new ResponseEntity<>(201, "创建成功", null);
        } else {
            return new ResponseEntity<>(404, "未知原因出错", null);
        }
    }

    /**
     * Change balance response.
     * @param userName   the user name
     * @param difference the difference
     * @return the response
     */
    @PutMapping("/wallet/user")
    public ResponseEntity<String> changeBalance(@RequestParam("username") String userName,
                                                @RequestParam("difference") double difference) {
        int ret = walletService.update(userName, difference);
        if (ret == -1) {
            return new ResponseEntity<>(404, "用户错误", null);
        }
        if(ret == -2){
            return new ResponseEntity<>(401, "余额不足", null);
        }
        WalletRecord record = new WalletRecord(-1L, userName, new Date(), difference, -1L);
        walletService.updateRecord(record);
        return new ResponseEntity<>(200, "更新成功", null);
    }

    /**
     * Delete wallet response.
     *
     * @param userName the user name
     * @return the response
     */
    @DeleteMapping("/wallet/user")
    public ResponseEntity<String> deleteWallet(@RequestParam("username") String userName) {
        int ret = walletService.delete(userName);
        if (ret == -1) {
            return new ResponseEntity<>(404, "用户信息错误", null);
        }
        return new ResponseEntity<>(200, "更新成功", null);
    }

    /**
     * Handle deal response.
     *
     * @param deal  the deal
     * @return the response
     */
    @PutMapping("/wallet/deal")
    public ResponseEntity<String> handleDeal(@RequestBody Deal deal) {
        String status = deal.getDealStatus();
        int ret = 2;
        String userName = "";
        double diff = 0;
        if (Objects.equals(status, "pending")) {
            userName = deal.getBuyerName();
            diff = -deal.getPrice();
            ret = walletService.update(userName, diff);
        } else if (Objects.equals(status, "finish")) {
            userName = deal.getSellerName();
            diff = deal.getPrice();
            ret = walletService.update(userName, diff);
        } else if(Objects.equals(status, "refund")) {
            userName = deal.getBuyerName();
            diff = deal.getPrice();
            ret = walletService.update(userName, diff);
        }
        if (ret == -1) {
            return new ResponseEntity<>(404, "更新错误", null);
        } else if (ret == 0) {
            WalletRecord walletRecord = new WalletRecord(-1L, userName, new Date(), diff, deal.getDealId());
            walletService.updateRecord(walletRecord);
        } else if(ret == -2){
            return new ResponseEntity<>(401, "余额不足", null);
        }
        return new ResponseEntity<>(200, "处理成功", null);
    }

    /**
     * Gets wallet.
     *
     * @param userName the user name
     * @return the wallet
     */
    @GetMapping("/wallet/user")
    public ResponseEntity<Wallet> getWallet(@RequestParam("username") String userName) {
        return new ResponseEntity<>(200, "", walletService.get(userName));
    }

    /**
     * Get deal response.
     *
     * @param userName the user name
     * @param size     <=0: all records(please use -1) size>0:return list with fixed length
     * @return the response
     */
    @GetMapping("/wallet/user/deal")
    public ResponseEntity<List<WalletRecord>> getDeal(@RequestParam("username") String userName,
                                                @RequestParam("size") int size) {
        return new ResponseEntity<>(200, "", walletService.getRecords(userName, size));
    }
}
