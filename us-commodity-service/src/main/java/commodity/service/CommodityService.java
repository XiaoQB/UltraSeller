package commodity.service;

import cn.edu.fudan.common.entities.dbo.Commodity;
import commodity.utils.PagedGridResult;

public interface CommodityService {

    PagedGridResult selectAll(int pageNum, int pageSize, int sequence);

    PagedGridResult selectAllByUsername(String username, int pageNum, int pageSize, int sequence);

    Commodity singleCommodity(String commodityId);

    void update(Commodity commodity);

    void create(Commodity commodity);

    void delete(long itemId);

    PagedGridResult searchList(String searchWords, int pageNum, int pageSize, String sequences);
}
