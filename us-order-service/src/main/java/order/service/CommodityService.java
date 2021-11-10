package order.service;

import order.entities.ResponseEntity;
import order.entities.dbo.Commodity;
import order.service.impl.CommodityFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author beethoven
 * @date 2021-11-06 19:27:47
 */
@FeignClient(value = "MS-CLOUD-PAYMENT", fallback = CommodityFallbackImpl.class)
@Service
@RequestMapping("/commodity")
public interface CommodityService {

    /**
     * 根据 id 查询商品
     *
     * @param token       token
     * @param commodityId commodity id
     * @return commodity
     */
    @GetMapping("/item")
    ResponseEntity<Commodity> getCommodityById(@RequestHeader("token") String token, @RequestParam("id") String commodityId);

}
