package order.entities.dto;

import com.alibaba.fastjson.JSONObject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import order.entities.dbo.Commodity;
import order.entities.dbo.Order;
import order.entities.dbo.SubOrder;

import java.util.List;

/**
 * @author joshua
 * @date 2021-11-09 14:39:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateOrderDTO {

    private Order order;
    private List<SubOrder> subOrders;

}