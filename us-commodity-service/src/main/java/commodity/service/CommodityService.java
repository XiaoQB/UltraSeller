package commodity.service;

import cn.edu.fudan.common.entities.dbo.Commodity;
import commodity.utils.PagedGridResult;

public interface CommodityService {

    public PagedGridResult selectAll(String username, int pageNum, int pageSize, int sequence);

    public Commodity singleCommodity(String commodityId);

    public void update(Commodity commodity);

    public void create(Commodity commodity);

    public void delete(long itemId);

    public PagedGridResult searchList(String searchWords, int pageNum, int pageSize, String sequences);
}
