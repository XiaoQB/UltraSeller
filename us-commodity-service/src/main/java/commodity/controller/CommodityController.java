package commodity.controller;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Commodity;
import com.netflix.client.http.HttpResponse;
import commodity.service.impl.CommodityServiceImpl;
import commodity.utils.IdGenerator;
import commodity.utils.PagedGridResult;
import commodity.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;


/**
 * The type Commodity controller.
 *
 * @author tristonk
 */
@RestController
public class CommodityController {

    private CommodityServiceImpl commodityService;

    /**
     * All commodities of a saler list.
     *
     * @param username the username
     * @param pageNum  the page num
     * @param pageSize the page size
     * @param sequence the sequence
     * @return the list
     */
    @GetMapping("/commodity/lists")
    public ResponseEntity<PagedGridResult> CommoditiesByUsername(@RequestParam("username") String username,
                                          @RequestParam("page") int pageNum,
                                          @RequestParam("pagesize") int pageSize,
                                          @RequestParam("seq") int sequence) {
        return new ResponseEntity<>(200,"",commodityService.selectAllByUsername(username, pageNum, pageSize, sequence));
    }

    /**
     * All commodities of a saler list.
     *
     * @param pageNum  the page num
     * @param pageSize the page size
     * @param sequence the sequence
     * @return the list
     */
    @GetMapping("/commodity/listall")
    public ResponseEntity<PagedGridResult> allCommodities(@RequestParam("page") int pageNum,
                                                          @RequestParam("pagesize") int pageSize,
                                                          @RequestParam("seq") int sequence) {
        return new ResponseEntity<>(200,"",commodityService.selectAll(pageNum, pageSize, sequence));
    }

    /**
     * Single commodity.
     *
     * @param commodityId the commodity id
     * @return the commodity
     */
    @GetMapping("/commodity/item")
    public ResponseEntity<Commodity> singleCommodity(@RequestParam("id") String commodityId) {
        Commodity ret = commodityService.singleCommodity(commodityId);
        if (ret == null) {
            return new ResponseEntity<>(404, "查询错误", null);
        }
        return new ResponseEntity<>(200, "成功", ret);
    }

    /**
     * Update.
     *
     * @param commodity the commodity
     * @return the response
     */
    @PutMapping("/commodity/item")
    public Response<String> update(@RequestBody Commodity commodity) {
        boolean result = commodityService.update(commodity);
        if (result)
            return new Response<>(201, "更新成功", null);
        else
            return new Response<>(401, "更新失败", null);
    }

    /**
     * Create.
     *
     * @param commodity the commodity
     * @return the response
     */
    @PostMapping("/commodity/item")
    
    public Response<String> create(@RequestBody Commodity commodity) {

        commodity.setId(IdGenerator.generateId());
        boolean result = commodityService.create(commodity);
        if (result)
            return new Response<>(201, "创建成功", null);
        else
            return new Response<>(401, "创建失败", null);
    }

    /**
     * Delete.
     *
     * @param itemId the item id
     * @return the response
     */
    @DeleteMapping("/commodity/item/{itemId}")
    public Response<String> delete(@PathVariable long itemId) {
        boolean result = commodityService.delete(itemId);
        if (result)
            return new Response<>(200, "删除成功", null);
        else
            return new Response<>(402, "删除失败", null);
    }

    /**
     * Search list.
     *
     * @param searchWords the search words
     * @return the list
     */
    @GetMapping("/commodity/search")
    public Response<PagedGridResult> searchList(@RequestParam("q") String searchWords,
                                                @RequestParam("page") int pageNum,
                                                @RequestParam("pagesize") int pageSize,
                                                @RequestParam(value = "seq", required = false, defaultValue = "0") String sequence) {
        return new Response<>(200, "查找成功", commodityService.searchList(searchWords, pageNum, pageSize, sequence));
    }

    @Autowired
    public void setCommodityService(CommodityServiceImpl commodityService) {
        this.commodityService = commodityService;
    }
}
