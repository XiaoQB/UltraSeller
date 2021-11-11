package wallet.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;

/**
 * @author tristonk
 */
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Wallet {

    private Long walletId;

    //private long userId;

    private String userName;

    private Double balance;

    private String role;
}
