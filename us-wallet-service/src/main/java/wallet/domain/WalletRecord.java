package wallet.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import java.util.Date;

/**
 * @author tristonk
 */
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class WalletRecord implements Comparable<WalletRecord> {

    private Long walletId;

    private String userName;

    private Date time;

    private Double amount;

    private Long orderId;

    @Override
    public int compareTo(WalletRecord o) {
        return this.getTime().before(o.getTime()) ? 1 : 0;
    }
}
