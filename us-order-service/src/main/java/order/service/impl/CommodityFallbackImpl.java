package order.service.impl;

import order.entities.ResponseEntity;
import order.entities.dbo.Commodity;
import order.entities.enums.ResponseEntityCode;
import order.entities.enums.ResponseEntityMessage;
import order.service.CommodityService;
import org.springframework.stereotype.Service;

/**
 * @author beethoven
 * @date 2021-11-06 19:45:11
 */
@Service
public class CommodityFallbackImpl implements CommodityService {

    @Override
    public ResponseEntity<Commodity> getCommodityById(String token, int commodityId) {
        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR, null);
    }
}
