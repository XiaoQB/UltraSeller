package order.entities.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import order.entities.dbo.Commodity;

import java.util.Map;

/**
 * @author beethoven
 * @date 2021-11-02 16:16:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateOrderDTO {

    private Integer buyerId;
    private Map<Commodity, Integer> commodities;
    private String address;
    private String status;

}
