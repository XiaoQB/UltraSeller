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
public class Deal {
    private String sellerName;

    private String buyerName;

    private Long dealId;

    private Double price;

    private String id;

    private String dealStatus;
}
