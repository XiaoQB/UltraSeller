package order.service;

import order.entities.dbo.Order;
import order.entities.dbo.SubOrder;
import order.entities.dto.CreateOrderDTO;
import order.entities.vo.OrderVO;
import order.exception.CommodityServiceException;
import order.exception.OrderNotFoundException;
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
     * @param token   token
     * @param orderId orderId
     * @return order
     * @throws OrderNotFoundException    OrderNotFoundException
     * @throws CommodityServiceException CommodityServiceException
     */
    OrderVO getOrderById(String token, String orderId) throws OrderNotFoundException, CommodityServiceException;

    /**
     * 根据 id 删除 order
     *
     * @param orderId orderId
     */
    void deleteOrderById(String orderId);

    /**
     * 更新 order
     *
     * @param order order
     */
    void changeOrder(Order order);

    /**
     * 更新 suborder
     *
     * @param suborder suborder
     */
    void changeSubOrder(SubOrder subOrder);

    /**
     * 根据 user id 获取 order list
     *
     * @param token   token
     * @param userIds userIds
     * @return order list
     * @throws CommodityServiceException CommodityServiceException
     */
    List<OrderVO> getOrdersByUser(String token, List<Integer> userIds, int page, int num) throws CommodityServiceException;

    /**
     * 根据 user id 获取 order list
     *
     * @param token   token
     * @param userIds userIds
     * @return order list
     * @throws CommodityServiceException CommodityServiceException
     */
    List<SubOrder> getOrdersBySaler(String token, List<Integer> userIds, int page, int num) throws CommodityServiceException;

    List<SubOrder> getSalerOrderListByStatus(String token,Integer userId,String status,int page,int num);

    /**
     * 根据 order status 获取 order list
     *
     * @param token   token
     * @param userIds userIds
     * @return order list
     * @throws CommodityServiceException CommodityServiceException
     */
    List<OrderVO> getBuyerOrderListByStatus(String token,Integer userId,String status,int page,int num) throws CommodityServiceException;
}
