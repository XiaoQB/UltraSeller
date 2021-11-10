package order.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author beethoven
 * @date 2021-11-02 16:16:45
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Commodity {

    private Integer commodityId;
    private String commodityName;
    private int salerId;
    private Float price;
    private int num;

}
