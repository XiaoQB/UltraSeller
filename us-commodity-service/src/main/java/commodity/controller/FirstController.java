package commodity.controller;

import commodity.domain.Commodity;
import commodity.mapper.CommodityMapper;
import commodity.service.CommodityService;
import commodity.service.impl.CommodityServiceImpl;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@MapperScan("commodity.mapper")
public class FirstController {


    @Autowired
    CommodityServiceImpl commodityService;

    @RequestMapping("/hello")
    public String helloSAE(){
        commodityService.test();
        return "helloSAE";
    }
}
