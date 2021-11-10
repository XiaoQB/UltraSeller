package order.entities.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import order.entities.dbo.Commodity;
import order.entities.dbo.SubOrder;

/**
 * @author beethoven
 * @date 2021-11-06 19:37:29
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class SubOrderVO extends SubOrder {

    private Commodity commodity;

    public SubOrderVO(SubOrder subOrder, Commodity commodity) {
        this.subOrderId = subOrder.getSubOrderId();
        this.orderId = subOrder.getOrderId();
        this.status = subOrder.getStatus();
        this.totalPrice = subOrder.getTotalPrice();
        this.address = subOrder.getAddress();
        this.salerId = subOrder.getSalerId();
        this.commodityId = subOrder.getCommodityId();
        this.commodityName = subOrder.getCommodityName();
        this.price = subOrder.getPrice();
        this.num = subOrder.getNum();
        this.commodity = commodity;
    }

}
