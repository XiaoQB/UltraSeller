package commodity.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import commodity.domain.CommodityExample;
import commodity.mapper.CommodityMapper;
import commodity.domain.Commodity;
import commodity.service.CommodityService;
import commodity.util.PagedGridResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommodityServiceImpl implements CommodityService {
    @Autowired
    CommodityMapper commodityMapper;

    @Override
    public PagedGridResult selectAll(String username,int page, int pagesize, int seq) {
        PageHelper.startPage(page, pagesize);
        List<Map<String, Object>> result =  commodityMapper.selectAllCommodity(username, page, pagesize, seq);
        return setterPagedGrid(result, 1);
    }

    public String test() { // 这是一个CommodityExample用于查询的例子, 相当于where后面的条件, https://zhuanlan.zhihu.com/p/42411540
                           // 具体可以搜索mybatis example类的用法
        CommodityExample example = new CommodityExample();
        CommodityExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo("zpw");
        System.out.println(commodityMapper);
        commodityMapper.countByExample(example);
        System.out.println("zpw ok ok ok ok !!!");
        return "ok";
    }

    @Override
    public Commodity singleCommodity(long commodityId){
        return commodityMapper.selectByPrimaryKey(commodityId+"");
        //return null;
    }

    @Override
    public void update(Commodity commodity){
        CommodityExample example = new CommodityExample();
        CommodityExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(commodity.getId()+"");
        commodityMapper.updateByExampleSelective(commodity, example);
    }

    @Override
    public void create(Commodity commodity){
        commodityMapper.insert(commodity);
    }

    @Override
    public void delete(long itemId){
        CommodityExample example = new CommodityExample();
        CommodityExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(itemId+"");
        commodityMapper.deleteByExample(example);
    }

    @Override
    public List<Commodity> searchList(String role, String searchWords){
        
        return null;
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
