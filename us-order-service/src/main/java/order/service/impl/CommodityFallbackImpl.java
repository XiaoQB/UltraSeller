package order.service.impl;

import cn.edu.fudan.common.entities.dbo.Commodity;
import cn.edu.fudan.common.entities.enums.ResponseEntityCode;
import cn.edu.fudan.common.entities.enums.ResponseEntityMessage;
import order.entities.ResponseEntity;
import order.service.CommodityService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author beethoven
 * @date 2021-11-06 19:45:11
 */
@Service
public class CommodityFallbackImpl implements CommodityService {

    @Override
    public ResponseEntity<Commodity> getCommodityById(@RequestParam("id") String commodityId) {
        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR, null);
    }

}
