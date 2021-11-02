package order.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 16:13:02
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {

    private String orderId;
    private String status;
    private Float totalPrice;
    private String address;
    private Integer buyerId;
    private Date createTime;
    private Date updateTime;

}
