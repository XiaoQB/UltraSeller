package commodity.controller;

import commodity.domain.Commodity;
import commodity.service.impl.CommodityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CommodityController {

    @Autowired
    CommodityServiceImpl commodityService;

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
    public ResponseEntity<Commodity> singleCommodity(@RequestHeader("Role") String role, @RequestParam("id") int commodityId){
        // for test, you can delete it
        return new ResponseEntity<Commodity>(commodityService.singleCommodity(commodityId), HttpStatus.CREATED);
    }

    @PutMapping("/commodity/item")
    public void update(@RequestBody Commodity commodity){

    }

    @PostMapping("/commodity/item")
    public void create(@RequestBody Commodity commodity){

    }

    @DeleteMapping("/commodity/item/{itemId}")
    public void delete(@PathVariable long itemId){

    }

    @GetMapping("/commodity/search")
    public List<Commodity> searchList(@RequestHeader("Role") String role, @RequestParam("q") String searchWords){
        return null;
    }

}
