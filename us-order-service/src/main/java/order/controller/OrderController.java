package order.controller;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Order;
import cn.edu.fudan.common.entities.dbo.SubOrder;
import cn.edu.fudan.common.entities.enums.ResponseEntityCode;
import cn.edu.fudan.common.entities.enums.ResponseEntityMessage;
import order.entities.dto.CreateOrderDTO;
import order.entities.dto.UpdateOrderDTO;
import order.entities.enums.OrderStatus;
import order.entities.vo.OrderVO;
import order.service.OrderService;
import order.service.WalletService;
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

    @Resource
    private WalletService walletService;

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
    public ResponseEntity<OrderVO> getOrderById(@RequestParam("order_id") String orderId) {
        try {
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orderService.getOrderById(orderId));
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
        Order order = updateOrderDTO.getOrder();
        List<SubOrder> subOrders = updateOrderDTO.getSubOrders();
        try {
            if (order != null) {
                orderService.changeOrder(order);
            }
            for (SubOrder subOrder : subOrders) {
                if (OrderStatus.WAIT_TO_TRANSFER.toString().equals(subOrder.getStatus())) {
                    ResponseEntity<String> response = walletService.changeBalance(updateOrderDTO.getUserName(), subOrder.getTotalPrice());
                    if (ResponseEntityCode.OK.getCode() != response.getCode()) {
                        return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), "wallet service error", null);
                    }
                    orderService.changeSubOrder(subOrder);
                }
            }
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, null);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/list")
    public ResponseEntity<List<OrderVO>> getOrdersByUser(@RequestParam("user_ids") List<Integer> userIds,
                                                         @RequestParam("page") Integer page,
                                                         @RequestParam("num") Integer num) {
        try {
            List<OrderVO> orders = orderService.getOrdersByUser(userIds, page, num);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/saler-list")
    public ResponseEntity<List<SubOrder>> getOrdersBySaler(@RequestParam("user_ids") List<Integer> userIds,
                                                           @RequestParam("page") Integer page,
                                                           @RequestParam("num") Integer num) {
        try {
            List<SubOrder> orders = orderService.getOrdersBySaler(userIds, page, num);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/saler-orders-status")
    public ResponseEntity<List<SubOrder>> getSalerOrderListByStatus(@RequestParam("user_id") Integer userId,
                                                                    @RequestParam("status") String status,
                                                                    @RequestParam("page") Integer page,
                                                                    @RequestParam("num") Integer num) {
        try {
            List<SubOrder> orders = orderService.getSalerOrderListByStatus(userId, status, page, num);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/buyer-orders-status")
    public ResponseEntity<List<OrderVO>> getBuyerOrderListByStatus(@RequestParam("user_id") Integer userId,
                                                                   @RequestParam("status") String status,
                                                                   @RequestParam("page") Integer page,
                                                                   @RequestParam("num") Integer num) {
        try {
            List<OrderVO> orders = orderService.getBuyerOrderListByStatus(userId, status, page, num);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

}
