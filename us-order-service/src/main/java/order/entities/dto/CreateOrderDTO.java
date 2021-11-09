package order.entities.dto;

import cn.edu.fudan.common.entities.dbo.Commodity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 16:16:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateOrderDTO {

    private Integer buyerId;
    private List<Commodity> commodities;
    private String address;
    private String status;

}
