package order.controller;

import order.entities.ResponseEntity;
import order.entities.dbo.Order;
import order.entities.dbo.SubOrder;
import order.entities.dto.CreateOrderDTO;
import order.entities.dto.UpdateOrderDTO;
import order.entities.enums.ResponseEntityCode;
import order.entities.enums.ResponseEntityMessage;
import order.entities.vo.OrderVO;
import order.service.OrderService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 16:19:29
 */
@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @PostMapping("/create")
    public ResponseEntity<String> createOrder(@RequestBody CreateOrderDTO createOrderDTO) {
        try {
            orderService.createOrder(createOrderDTO);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, null);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/get")
    public ResponseEntity<OrderVO> getOrderById(@RequestHeader("token") String token, @RequestParam("order_id") String orderId) {
        try {
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orderService.getOrderById(token, orderId));
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @DeleteMapping("/delete")
    public ResponseEntity<String> deleteOrderById(@RequestParam("order_id") String orderId) {
        try {
            orderService.deleteOrderById(orderId);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, null);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @PutMapping("/change")
    public ResponseEntity<String> changeOrder(@RequestBody UpdateOrderDTO updateOrderDTO) {
        Order order=updateOrderDTO.getOrder();
        List<SubOrder> subOrders=updateOrderDTO.getSubOrders();
        try {
            if(order!=null){
                orderService.changeOrder(order);
            }
            if(subOrders!=null){
                subOrders.forEach((subOrder)-> orderService.changeSubOrder(subOrder));
            }
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, null);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/list")
    public ResponseEntity<List<OrderVO>> getOrdersByUser(@RequestHeader("token") String token, @RequestParam("user_ids") List<Integer> userIds) {
        try {
            List<OrderVO> orders = orderService.getOrdersByUser(token, userIds);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/saler-list")
    public ResponseEntity<List<SubOrder>> getOrdersBySaler(@RequestHeader("token") String token, @RequestParam("user_ids") List<Integer> userIds) {
        try {
            List<SubOrder> orders = orderService.getOrdersBySaler(token, userIds);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

}
