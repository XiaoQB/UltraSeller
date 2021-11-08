package order.util;

import order.entities.ResponseEntity;
import order.entities.dbo.Commodity;
import order.entities.dbo.SubOrder;
import order.entities.enums.ResponseEntityCode;
import order.entities.vo.SubOrderVO;
import order.exception.CommodityServiceException;
import order.service.CommodityService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-06 19:55:43
 */
@Component
public class RestUtil {

    @Resource
    private CommodityService commodityService;

    public List<SubOrderVO> getSubOrderVOList(String token, List<SubOrder> subOrders) throws CommodityServiceException {
        List<SubOrderVO> subOrderList = new ArrayList<>();
        for (SubOrder subOrder : subOrders) {
            ResponseEntity<Commodity> response = commodityService.getCommodityById(token, subOrder.getCommodityId());
            if (ResponseEntityCode.OK.getCode() == response.getCode()) {
                throw new CommodityServiceException("commodity service error");
            }
            Commodity commodity = response.getData();
            subOrderList.add(new SubOrderVO(subOrder, commodity));
        }
        return subOrderList;
    }

}
