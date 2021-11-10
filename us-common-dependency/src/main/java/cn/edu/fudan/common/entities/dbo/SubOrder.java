package cn.edu.fudan.common.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author beethoven
 * @date 2021-11-02 16:14:38
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubOrder {

    protected String subOrderId;
    protected String orderId;
    protected String status;
    protected Float totalPrice;
    protected String address;
<<<<<<< HEAD:us-order-service/src/main/java/order/entities/dbo/SubOrder.java
    protected Integer salerId;
=======
    protected Long salerId;
>>>>>>> master:us-common-dependency/src/main/java/cn/edu/fudan/common/entities/dbo/SubOrder.java
    protected String commodityId;
    protected String commodityName;
    protected Float price;
    protected Integer num;
    protected Date createTime;
    protected Date updateTime;

}
