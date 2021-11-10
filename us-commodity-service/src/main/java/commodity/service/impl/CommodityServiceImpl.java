package commodity.service.impl;

import cn.edu.fudan.common.entities.dbo.Commodity;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import commodity.domain.CommodityExample;
import commodity.mapper.CommodityMapper;
import commodity.service.CommodityService;
import commodity.utils.PagedGridResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommodityServiceImpl implements CommodityService {

    @Resource
    CommodityMapper commodityMapper;

    @Override
    public PagedGridResult selectAll(String username, int pageNum, int pageSize, int sequence) {
        PageHelper.startPage(pageNum, pageSize);
        CommodityExample example = new CommodityExample();
        List<Commodity> commodities = commodityMapper.selectByExample(example);
        return setterPagedGrid(commodities, 1);
    }

    @Override
<<<<<<< HEAD
    public Commodity singleCommodity(String commodityId){
        return commodityMapper.selectByPrimaryKey(commodityId+"");
        //return null;
=======
    public Commodity singleCommodity(String commodityId) {
        return commodityMapper.selectByPrimaryKey(commodityId);
>>>>>>> master
    }

    @Override
    public void update(Commodity commodity) {
        CommodityExample example = new CommodityExample();
        CommodityExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(commodity.getId() + "");
        commodityMapper.updateByExampleSelective(commodity, example);
    }

    @Override
    public void create(Commodity commodity) {
        commodityMapper.insert(commodity);
    }

    @Override
    public void delete(long itemId) {
        CommodityExample example = new CommodityExample();
        CommodityExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(itemId + "");
        commodityMapper.deleteByExample(example);
    }

    @Override
    public PagedGridResult searchList(String searchWords, int pageNum, int pageSize, String sequence) {
        PageHelper.startPage(pageNum, pageSize);
        CommodityExample example = new CommodityExample();
        CommodityExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike("%" + searchWords + "%");
        List<Commodity> commodities = commodityMapper.selectByExample(example);
        return setterPagedGrid(commodities, 1);
    }

    private PagedGridResult setterPagedGrid(List<?> list, Integer page) {
        PageInfo<?> pageList = new PageInfo<>(list);
        PagedGridResult grid = new PagedGridResult();
        grid.setPage(page);
        grid.setRows(list);
        grid.setTotal(pageList.getPages());
        grid.setRecords(pageList.getTotal());
        return grid;
    }
}
