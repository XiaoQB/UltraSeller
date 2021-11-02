package order.service.impl;

import order.dao.OrderDao;
import order.entities.dbo.Commodity;
import order.entities.dbo.Order;
import order.entities.dto.CreateOrderDTO;
import order.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 16:26:16
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    @Override
    public void createOrder(CreateOrderDTO createOrderDTO) {

        double sum = createOrderDTO.getCommodities().keySet().stream().mapToDouble(Commodity::getPrice).sum();
        Date date = new Date();
        Order order = Order.builder()
                .status(createOrderDTO.getStatus())
                .buyerId(createOrderDTO.getBuyerId())
                .address(createOrderDTO.getAddress())
                .createTime(date)
                .updateTime(date)
                .totalPrice(sum)
                .build();

        orderDao.createOrder(order);
    }

    @Override
    public Order getOrderById(int orderId) {
        return orderDao.getOrderById(orderId);
    }

    @Override
    public void deleteOrderById(int orderId) {
        orderDao.deleteOrderById(orderId);
    }

    @Override
    public void changeOrder(Order order) {
        orderDao.changeOrder(order);
    }

    @Override
    public List<Order> getOrdersByUser(List<Integer> userIds) {
        return orderDao.getOrdersByUser(userIds);
    }

}
