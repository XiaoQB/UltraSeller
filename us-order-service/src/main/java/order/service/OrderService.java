package order.service;

import order.entities.dbo.Order;
import order.entities.dto.CreateOrderDTO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 16:26:02
 */
@Service
public interface OrderService {
    /**
     * 创建 order
     *
     * @param createOrderDTO createOrderDTO
     */
    void createOrder(CreateOrderDTO createOrderDTO);

    /**
     * 根据 id 获取 order
     *
     * @param orderId orderId
     * @return order
     */
    Order getOrderById(int orderId);

    /**
     * 根据 id 删除 order
     *
     * @param orderId orderId
     */
    void deleteOrderById(int orderId);

    /**
     *  更新 order
     *
     * @param order order
     */
    void changeOrder(Order order);

    /**
     * 根据 user id 获取 order list
     *
     * @param userIds userIds
     * @return order list
     */
    List<Order> getOrdersByUser(List<Integer> userIds);
}
