package order.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author beethoven
 * @date 2021-11-02 16:14:38
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubOrder {

    private String subOrderId;
    private String orderId;
    private Integer salerId;
    private String commodityId;
    private String commodityName;
    private Float price;
    private Integer num;
    private String status;

}
