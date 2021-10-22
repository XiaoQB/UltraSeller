package commodity.service;

import commodity.domain.Commodity;

import java.util.List;

public interface CommodityService {
    public List<Commodity> selectAll();

    public Commodity singleCommodity(long commodityId);

    public void update(Commodity commodity);

    public void create(Commodity commodity);

    public void delete(long itemId);

    public List<Commodity> searchList(String role, String searchWords);
}
