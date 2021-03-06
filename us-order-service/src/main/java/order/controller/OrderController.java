package order.controller;

import cn.edu.fudan.common.entities.ResponseEntity;
import cn.edu.fudan.common.entities.dbo.Order;
import cn.edu.fudan.common.entities.dbo.SubOrder;
import cn.edu.fudan.common.entities.enums.ResponseEntityCode;
import cn.edu.fudan.common.entities.enums.ResponseEntityMessage;
import order.dao.OrderDao;
import order.entities.dto.CreateOrderDTO;
import order.entities.dto.UpdateOrderDTO;
import order.entities.enums.OrderStatus;
import order.entities.vo.Notification;
import order.entities.vo.OrderVO;
import order.entities.vo.PageResult;
import order.entities.vo.SubOrderVO;

import order.service.KafkaService;
import order.service.OrderService;
import order.service.WalletService;
import org.springframework.kafka.core.KafkaTemplate;

import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;
import java.util.zip.InflaterInputStream;

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


    @Resource
    private KafkaService kafkaService;


    @Resource
    private OrderDao orderDao;

    @PostMapping("/create")
    public ResponseEntity<String> createOrder(@RequestBody CreateOrderDTO createOrderDTO) {
        try {
            orderService.createOrder(createOrderDTO);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, null);
        } catch (Exception e) {
            e.printStackTrace();
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
    public ResponseEntity<String> changeOrder(@RequestBody @Valid UpdateOrderDTO updateOrderDTO) {
        Order order = updateOrderDTO.getOrder();
        List<SubOrder> subOrders = updateOrderDTO.getSubOrders();
        try {
            if (order != null) {
                orderService.changeOrder(order);
            }
            for (SubOrder subOrder : subOrders) {
                if (OrderStatus.WAIT_TO_TRANSFER.toString().equals(subOrder.getStatus())) {
                    kafkaService.sendPayMessage(subOrder, updateOrderDTO.getBuyerId());
                }
                if(OrderStatus.WAIT_TO_RECEIPT.toString().equals(subOrder.getStatus())){
                    kafkaService.sendReceiveMsg(subOrder, updateOrderDTO.getBuyerId());
                }
                if(OrderStatus.COMPLETE.toString().equals(subOrder.getStatus())){
                    kafkaService.sendCompleteMsg(subOrder, updateOrderDTO.getBuyerId());
                }
                orderService.changeSubOrder(subOrder);
            }
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, null);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }


    @GetMapping("/list")
    //????????????
    public ResponseEntity<List<OrderVO>> getOrdersByUser(@RequestParam("user_ids") List<Integer> userIds) {
        try {
            List<OrderVO> orders = orderService.getOrdersByUser(userIds);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/saler-list")
    public ResponseEntity<List<SubOrderVO>> getOrdersBySaler(@RequestParam("user_ids") List<Integer> userIds,
                                                             @RequestParam("page") Integer page,
                                                             @RequestParam("num") Integer num) {
        try {
            List<SubOrderVO> orders = orderService.getOrdersBySaler(userIds, page, num);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orders);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/saler-orders-status")
    public ResponseEntity<List<SubOrderVO>> getSalerOrderListByStatus(@RequestParam("user_id") Integer userId,
                                                                      @RequestParam("status") String status,
                                                                      @RequestParam("page") Integer page,
                                                                      @RequestParam("num") Integer num) {
        try {
            List<SubOrderVO> orders = orderService.getSalerOrderListByStatus(userId, status, page, num);
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

    @GetMapping("/order-detail")
    public ResponseEntity<SubOrderVO> getSubOrderDetail(@RequestParam("subOrderId") String subOrderId) {
        try {
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orderService.getSubOrderDetailById(subOrderId));
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }


    @GetMapping("/notification/saler/pay")
    public ResponseEntity<PageResult> getPayNotification(@RequestParam("salerId") Integer salerId,
                                                                 @RequestParam("page") Integer page,
                                                                 @RequestParam("num") Integer num) {
        try {
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orderService.getPaymentNotification(salerId,page,num));
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/notification/saler/complete")
    public ResponseEntity<PageResult> getCompleteNotification(@RequestParam("salerId") Integer salerId,
                                                                      @RequestParam("page") Integer page,
                                                                      @RequestParam("num") Integer num
                                                                      ) {
        try {
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orderService.getCompleteNotification(salerId,page,num));
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @GetMapping("/notification/buyer/receive")
    public ResponseEntity<PageResult> getSalerNotification(@RequestParam("buyerId") Integer buyerId,
                                                           @RequestParam("page") Integer page,
                                                           @RequestParam("num") Integer num) {
        try {
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, orderService.getReceiveNotification(buyerId,page,num));
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }

    @PostMapping("/notification/change")
    public ResponseEntity<String> changeStatus(@RequestParam("id") Integer id) {
        try {
            orderDao.changeNotificationStatus(id);
            return new ResponseEntity<>(ResponseEntityCode.OK.getCode(), ResponseEntityMessage.SUCCESS, null);
        } catch (Exception e) {
            return new ResponseEntity<>(ResponseEntityCode.ERROR.getCode(), ResponseEntityMessage.ERROR + e.getMessage(), null);
        }
    }


}
