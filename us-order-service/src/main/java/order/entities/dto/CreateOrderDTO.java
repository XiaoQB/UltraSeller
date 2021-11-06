package order.entities.dto;

import com.alibaba.fastjson.JSONObject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import order.entities.dbo.Commodity;

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
