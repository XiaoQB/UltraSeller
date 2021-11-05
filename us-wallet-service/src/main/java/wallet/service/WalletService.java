package wallet.service;

import wallet.domain.Wallet;

/**
 * @author tristonk
 */
public interface WalletService {

    public int create(Wallet wallet);

    public int update(String userName, double difference);

    public int delete(String userName);

    public Wallet get(String userName);
}
