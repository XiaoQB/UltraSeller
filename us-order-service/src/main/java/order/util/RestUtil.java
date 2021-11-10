package order.util;

import cn.edu.fudan.common.entities.dbo.Commodity;
import cn.edu.fudan.common.entities.dbo.SubOrder;
import cn.edu.fudan.common.entities.enums.ResponseEntityCode;
import order.entities.ResponseEntity;
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

    public List<SubOrderVO> getSubOrderVOList(List<SubOrder> subOrders) throws CommodityServiceException {
        List<SubOrderVO> subOrderList = new ArrayList<>();
        for (SubOrder subOrder : subOrders) {
            ResponseEntity<Commodity> response = commodityService.getCommodityById(subOrder.getCommodityId());
            if (ResponseEntityCode.OK.getCode() != response.getCode()) {
                throw new CommodityServiceException("commodity service error");
            }
            Commodity commodity = response.getData();
            subOrderList.add(new SubOrderVO(subOrder, commodity));
        }
        return subOrderList;
    }

}
