package commodity.service;

import commodity.domain.Commodity;
import commodity.util.PagedGridResult;

import java.util.List;

public interface CommodityService {
    public PagedGridResult selectAll(String username,int page, int pagesize, int seq);

    public Commodity singleCommodity(long commodityId);

    public void update(Commodity commodity);

    public void create(Commodity commodity);

    public void delete(long itemId);

    public List<Commodity> searchList(String role, String searchWords);
}
