package order.entities.dto;

import cn.edu.fudan.common.entities.dbo.Order;
import cn.edu.fudan.common.entities.dbo.SubOrder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
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
    private Integer buyerId;

}
