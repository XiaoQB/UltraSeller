package commodity.controller;

import commodity.domain.Commodity;
import commodity.service.impl.CommodityServiceImpl;
import commodity.utils.IdGenerator;
import commodity.utils.PagedGridResult;
import common.JwtUtil;
import common.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

/**
 * The type Commodity controller.
 *
 * @author tristonk
 */
@RestController
public class CommodityController {

    @Autowired
    private CommodityServiceImpl commodityService;

    /**
     * All commodities list.
     *
     * @param token    the token
     * @param username the username
     * @param pageNum  the page num
     * @param pageSize the page size
     * @param sequence the sequence
     * @return the list
     */
    @GetMapping("/commodity/lists")
    public Response<List<Commodity>> allCommodities(@RequestHeader("token") String token,
                                          @RequestParam("username") String username,
                                          @RequestParam("page") int pageNum,
                                          @RequestParam("pagesize") int pageSize,
                                          @RequestParam("seq") int sequence
                                          ){
        List<Commodity> ret = null;
        if(Objects.equals(JwtUtil.getRole(token), "saler")){
            //TODO: change it
            PagedGridResult  result= commodityService.selectAll(username, pageNum, pageSize, sequence);
        } else {
            PagedGridResult  result= commodityService.selectAll(username, pageNum, pageSize, sequence);
        }
        return new Response<>(200, "", ret);
    }

    /**
     * Single commodity.
     *
     * @param token       the token
     * @param commodityId the commodity id
     * @return the commodity
     */
    @GetMapping("/commodity/item")
    public Response<Commodity> singleCommodity(@RequestHeader("token") String token, @RequestParam("id") int commodityId){
        Commodity ret = commodityService.singleCommodity(commodityId);
        if(ret == null){
            return new Response<>(404, "查询错误",null);
        }
        if(Objects.equals(JwtUtil.getRole(token), "saler")){
            if(!Objects.equals(JwtUtil.getUserName(token), ret.getVendorName())){
                return new Response<>(400, "权限错误",null);
            }
        }
        return new Response<>(200, "成功", ret);
    }

    /**
     * Update.
     *
     * @param token     the token
     * @param commodity the commodity
     * @return the response
     */
    @PutMapping("/commodity/item")
    public Response<String> update(@RequestHeader("token") String token, @RequestBody Commodity commodity){
        if(Objects.equals(JwtUtil.getRole(token), "admin") ||
                Objects.equals(JwtUtil.getUserName(token), commodity.getVendorName())){
            commodityService.update(commodity);
            return new Response<>(201, "更新成功", null);

        }
        return new Response<>(400, "权限错误",null);
    }

    /**
     * Create.
     *
     * @param token     the token
     * @param commodity the commodity
     * @return the response
     */
    @PostMapping("/commodity/item")
    public Response<String> create(@RequestHeader("token") String token, @RequestBody Commodity commodity){
        if(Objects.equals(JwtUtil.getRole(token), "admin") ||
                Objects.equals(JwtUtil.getUserName(token), commodity.getVendorName())){
            commodity.setId(IdGenerator.generateId());
            commodityService.create(commodity);
            return new Response<>(201, "创建成功", null);
        }
        return new Response<>(400, "权限错误",null);
    }

    /**
     * Delete.
     *
     * @param token  the token
     * @param itemId the item id
     * @return the response
     */
    @DeleteMapping("/commodity/item/{itemId}")
    public Response<String> delete(@RequestHeader("token") String token, @PathVariable long itemId){
        if(Objects.equals(JwtUtil.getRole(token), "admin") ||
                Objects.equals(JwtUtil.getUserName(token),
                        commodityService.singleCommodity(itemId).getVendorName())){
            commodityService.delete(itemId);
            return new Response<>(200, "删除成功", null);
        }
        return new Response<>(400, "权限错误",null);
    }

    /**
     * Search list.
     *
     * @param token       the token
     * @param searchWords the search words
     * @return the list
     */
    @GetMapping("/commodity/search")
    public Response<List<Commodity>> searchList(@RequestHeader("token") String token, @RequestParam("q") String searchWords){
        List<Commodity> ret = null;
        if(Objects.equals(JwtUtil.getRole(token), "saler")){
            //TODO: change it
            ret = commodityService.searchList("saler", searchWords);
        } else {
            ret = commodityService.searchList(JwtUtil.getRole(token), searchWords);
        }
        return new Response<>(200, "", ret);
    }
}
