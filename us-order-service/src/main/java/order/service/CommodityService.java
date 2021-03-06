package order.service;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Commodity;

import order.service.impl.CommodityFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author beethoven
 * @date 2021-11-06 19:27:47
 */
@FeignClient(value = "us-commodity-service", fallback = CommodityFallbackImpl.class)
@Service
public interface CommodityService {

    /**
     * 根据 id 查询商品
     *
     * @param commodityId commodity id
     * @return commodity
     */
    @GetMapping("/commodity/item")
    ResponseEntity<Commodity> getCommodityById(@RequestParam("id") String commodityId);


}
