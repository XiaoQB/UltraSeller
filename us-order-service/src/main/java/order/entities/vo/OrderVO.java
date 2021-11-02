package order.entities.vo;

import lombok.*;
import order.entities.dbo.Order;
import order.entities.dbo.SubOrder;

import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 21:18:16
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class OrderVO extends Order {

    private List<SubOrder> subOrders;

    public OrderVO(Order order, List<SubOrder> subOrders) {
        this.orderId = order.getOrderId();
        this.address = order.getAddress();
        this.buyerId = order.getBuyerId();
        this.status = order.getStatus();
        this.totalPrice = order.getTotalPrice();
        this.createTime = order.getCreateTime();
        this.updateTime = order.getUpdateTime();
        this.subOrders = subOrders;
    }
}
