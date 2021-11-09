package commodity.service;

import commodity.domain.Commodity;
import commodity.utils.PagedGridResult;
import commodity.domain.CommodityList;

import java.util.List;

public interface CommodityService {

    public PagedGridResult selectAll(String username, int pageNum, int pageSize, int sequence);

    public Commodity singleCommodity(long commodityId);

    public void update(Commodity commodity);

    public void create(Commodity commodity);

    public void delete(long itemId);

    public PagedGridResult searchList(String searchWords, int pageNum, int pageSize, String sequences);
}
