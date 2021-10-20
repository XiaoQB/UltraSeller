package commodity.service.impl;

import commodity.mapper.CommodityMapper;
import commodity.domain.Commodity;
import commodity.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class CommodityServiceImpl implements CommodityService {
    @Autowired
    CommodityMapper commodityMapper;

    @Override
    public List<Commodity> selectAll() {
        return null;
    }
}
