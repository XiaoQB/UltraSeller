package wallet.service;

import wallet.domain.Wallet;
import wallet.domain.WalletRecord;

import java.util.List;

/**
 * @author tristonk
 */
public interface WalletService {

    public int create(Wallet wallet);

    public int update(String userName, double difference);

    public int delete(String userName);

    public Wallet get(String userName);

    public List<WalletRecord> getRecords(String userName);

    public List<WalletRecord> getRecords(String userName, int size);

    public void updateRecord(WalletRecord record);
}
