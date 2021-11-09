package order.service.impl;

import cn.edu.fudan.common.entities.dbo.Commodity;
import cn.edu.fudan.common.entities.dbo.Order;
import cn.edu.fudan.common.entities.dbo.SubOrder;
import order.dao.OrderDao;
import order.dao.SubOrderDao;
import order.entities.dto.CreateOrderDTO;
import order.entities.vo.OrderVO;
import order.exception.CommodityServiceException;
import order.exception.OrderNotFoundException;
import order.service.OrderService;
import order.util.RestUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author beethoven
 * @date 2021-11-02 16:26:16
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private RestUtil restUtil;

    @Resource
    private OrderDao orderDao;

    @Resource
    private SubOrderDao subOrderDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createOrder(CreateOrderDTO createOrderDTO) {
        String orderId = UUID.randomUUID().toString();
        List<SubOrder> subOrders = new ArrayList<>();
        float sum = 0;

        for (Commodity commodity : createOrderDTO.getCommodities()) {
            float totalPrice = commodity.getPrice() * commodity.getNum();
            sum += totalPrice;
            SubOrder subOrder = SubOrder.builder()
                    .subOrderId(UUID.randomUUID().toString())
                    .status(createOrderDTO.getStatus())
                    .orderId(orderId)
                    .totalPrice(totalPrice)
                    .address(createOrderDTO.getAddress())
                    .salerId(commodity.getSalerId())
                    .commodityId(commodity.getCommodityId())
                    .commodityName(commodity.getCommodityName())
                    .price(commodity.getPrice())
                    .num(commodity.getNum())
                    .build();
            subOrders.add(subOrder);
        }

        Date date = new Date();
        Order order = Order.builder()
                .orderId(orderId)
                .status(createOrderDTO.getStatus())
                .buyerId(createOrderDTO.getBuyerId())
                .address(createOrderDTO.getAddress())
                .createTime(date)
                .updateTime(date)
                .totalPrice(sum)
                .build();

        orderDao.createOrder(order);
        subOrderDao.createSubOrders(subOrders);
    }

    @Override
    public OrderVO getOrderById(String orderId) throws OrderNotFoundException, CommodityServiceException {
        Order order = orderDao.getOrderById(orderId);
        if (order == null) {
            throw new OrderNotFoundException("no such order");
        }

        List<SubOrder> subOrders = subOrderDao.getSubOrdersByOrder(orderId);
        return new OrderVO(order, restUtil.getSubOrderVOList(subOrders));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOrderById(String orderId) {
        orderDao.deleteOrderById(orderId);
        subOrderDao.deleteSubOrderByOrderId(orderId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changeOrder(Order order) {
        orderDao.changeOrder(order);
    }

    @Override
    public List<OrderVO> getOrdersByUser(List<Integer> userIds) throws CommodityServiceException {
        List<OrderVO> orderVOList = new ArrayList<>();
        List<Order> orders = orderDao.getOrdersByUser(userIds);
        for (Order order : orders) {
            List<SubOrder> subOrders = subOrderDao.getSubOrdersByOrder(order.getOrderId());
            orderVOList.add(new OrderVO(order, restUtil.getSubOrderVOList(subOrders)));
        }
        return orderVOList;
    }

}
