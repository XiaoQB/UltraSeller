package order.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author beethoven
 * @date 2021-11-02 16:13:02
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {

    protected String orderId;
    protected String status;
    protected Float totalPrice;
    protected String address;
    protected Integer buyerId;
    protected Date createTime;
    protected Date updateTime;

}
