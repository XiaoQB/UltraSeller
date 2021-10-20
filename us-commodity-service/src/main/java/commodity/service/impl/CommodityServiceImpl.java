package commodity.service.impl;

import commodity.domain.CommodityExample;
import commodity.mapper.CommodityMapper;
import commodity.domain.Commodity;
import commodity.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityServiceImpl implements CommodityService {
    @Autowired
    CommodityMapper commodityMapper;

    @Override
    public List<Commodity> selectAll() {
        return null;
    }

    public String test() { // 这是一个CommodityExample用于查询的例子, 相当于where后面的条件, https://zhuanlan.zhihu.com/p/42411540
                           // 具体可以搜索mybatis example类的用法
        CommodityExample example = new CommodityExample();
        CommodityExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo("zpw");
        System.out.println(commodityMapper);
        commodityMapper.countByExample(example);
        System.out.println("zpw ok ok ok ok !!!");
        return "ok";
    }
}
