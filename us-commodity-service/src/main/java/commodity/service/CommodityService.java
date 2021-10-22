package commodity.service;

import commodity.domain.Commodity;
import commodity.utils.PagedGridResult;

import java.util.List;

public interface CommodityService {
    public PagedGridResult selectAll(String username, int page, int pagesize, int seq);

    public Commodity singleCommodity(long commodityId);

    public void update(Commodity commodity);

    public void create(Commodity commodity);

    public void delete(long itemId);

    public PagedGridResult searchList(String role, String username, String searchWords, int page, int pagesize);
}
