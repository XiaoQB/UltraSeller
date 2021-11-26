package commodity.service;

import cn.edu.fudan.common.entities.dbo.Commodity;
import commodity.utils.PagedGridResult;

public interface CommodityService {

    PagedGridResult selectAll(int pageNum, int pageSize, int sequence);

    PagedGridResult selectAllByUsername(String username, int pageNum, int pageSize, int sequence);

    Commodity singleCommodity(String commodityId);

    boolean update(Commodity commodity);

    boolean create(Commodity commodity);

    boolean delete(long itemId);

    PagedGridResult searchList(String searchWords, int pageNum, int pageSize, String sequences);
}
