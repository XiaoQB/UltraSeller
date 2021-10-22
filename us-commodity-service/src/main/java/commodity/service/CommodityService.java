package commodity.service;

import commodity.domain.Commodity;
import commodity.domain.CommodityList;

import java.util.List;

public interface CommodityService {
    public CommodityList selectAll(String role, String userName, int pageNum, int pageSize, String seq);

    public Commodity singleCommodity(long commodityId);

    public void update(Commodity commodity);

    public void create(Commodity commodity);

    public void delete(long itemId);

    public CommodityList searchList(String role, String userName, int pageNum,
                                    int pageSize, String seq, String searchWords);
}
