package commodity.domain;

import cn.edu.fudan.common.entities.dbo.Commodity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import java.util.List;

/**
 * @author tristonk
 */
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class CommodityList {
    private List<Commodity> commodities;
    private int commoditiesSize;
    private int allCommoditiesSize;
}
