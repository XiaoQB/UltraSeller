package commodity.controller;

import commodity.domain.Commodity;
import commodity.service.CommodityService;
import commodity.utils.IdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @GetMapping("/commodity/lists")
    public List<Commodity> allCommodities(@RequestHeader("Role") String role,
                                          @RequestParam("username") String username,
                                          @RequestParam("page") int pageNum,
                                          @RequestParam("pagesize") int pageSize,
                                          @RequestParam("seq") String sequence
                                          ){
        return null;
    }

    @GetMapping("/commodity/item")
    public Commodity singleCommodity(@RequestHeader("Role") String role, @RequestParam("id") int commodityId){
        return commodityService.singleCommodity(commodityId);
    }

    @PutMapping("/commodity/item")
    public void update(@RequestBody Commodity commodity){
        commodityService.update(commodity);
    }

    @PostMapping("/commodity/item")
    public void create(@RequestBody Commodity commodity){
        commodity.setId(IdGenerator.generateId());
        commodityService.create(commodity);
    }

    @DeleteMapping("/commodity/item/{itemId}")
    public void delete(@PathVariable long itemId){
        commodityService.delete(itemId);
    }

    @GetMapping("/commodity/search")
    public List<Commodity> searchList(@RequestHeader("Role") String role, @RequestParam("q") String searchWords){
        return null;
    }

}
