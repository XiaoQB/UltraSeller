package order.dao;

import cn.edu.fudan.common.entities.dbo.Order;
import cn.edu.fudan.common.entities.dbo.SubOrder;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 16:34:13
 */
@Mapper
public interface OrderDao {

    /**
     * 创建 order
     *
     * @param order order
     */
    void createOrder(Order order);

    /**
     * 根据 id 获取 order
     *
     * @param orderId orderId
     * @return order
     */
    Order getOrderById(String orderId);

    /**
     * 根据 id 删除 order
     *
     * @param orderId orderId
     */
    @Delete("delete from `order` where id = #{orderId}")
    void deleteOrderById(String orderId);

    /**
     * 更新 order
     *
     * @param order order
     */
    void changeOrder(Order order);

    /**
     * 更新 order
     *
     * @param order order
     */
    void changeSubOrder(SubOrder subOrder);

    /**
     * 根据 user id 获取 order list
     *
     * @param userIds userIds
     * @return order list
     */
    List<Order> getOrdersByUser(@Param("userIds") List<Integer> userIds, @Param("page") Integer page, @Param("num") Integer num);

    List<SubOrder> getSubOrdersByUser(@Param("userIds") List<Integer> userIds, @Param("page") Integer page, @Param("num") Integer num);

    List<SubOrder> getSalerOrderListByStatus(@Param("userId") Integer userId, @Param("status") String status, @Param("page") Integer page, @Param("num") Integer num);

    List<Order> getBuyerOrdersByStatus(@Param("userId") Integer userId, @Param("status") String status, @Param("page") Integer page, @Param("num") Integer num);

    SubOrder getSubOrderDetailById(@Param("subOrderId") String subOrderId);
}
