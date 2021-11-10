package wallet.service.impl;

import org.springframework.stereotype.Service;
import wallet.domain.Wallet;
import wallet.domain.WalletExample;
import wallet.mapper.WalletMapper;
import wallet.service.WalletService;

import java.util.List;

/**
 * @author tristonk
 */
@Service
public class WalletServiceImpl implements WalletService {

    WalletMapper walletMapper;

    @Override
    public int create(Wallet wallet) {
        WalletExample example = new WalletExample();
        WalletExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(wallet.getUserName());
        if(walletMapper.countByExample(example) != 0){
            return -1;
        }
        walletMapper.insert(wallet);
        return 0;
    }

    @Override
    public int update(String userName, double difference) {
        WalletExample example = new WalletExample();
        WalletExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(userName);
        List<Wallet> walletList = walletMapper.selectByExample(example);
        if(walletList.isEmpty()) {
            return -1;
        }
        Wallet wallet = walletList.get(0);
        wallet.setBalance(wallet.getBalance()+difference);
        walletMapper.updateByExample(wallet, example);
        return 0;
    }

    @Override
    public int delete(String userName) {
        WalletExample example = new WalletExample();
        WalletExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(userName);
        if(walletMapper.countByExample(example) == 0){
            return -1;
        }
        walletMapper.deleteByExample(example);
        return 0;
    }

    @Override
    public Wallet get(String userName) {
        WalletExample example = new WalletExample();
        WalletExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(userName);
        List<Wallet> walletList = walletMapper.selectByExample(example);
        if(walletList.size() != 1){
            return null;
        }
        return walletList.get(0);
    }
}
