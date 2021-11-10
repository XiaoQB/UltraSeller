package order.dao;

import cn.edu.fudan.common.entities.dbo.SubOrder;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 20:14:11
 */
@Mapper
public interface SubOrderDao {

    /**
     * 创建 sub orders
     *
     * @param subOrders subOrders
     */
    void createSubOrders(@Param("subOrders") List<SubOrder> subOrders);

    /**
     * 根据 order id 删除 sub order
     *
     * @param orderId orderId
     */
    @Delete("delete from sub_order where order_id = #{orderId}")
    void deleteSubOrderByOrderId(String orderId);

    /**
     * 根据 order id 获取 sub order
     *
     * @param orderId orderId
     * @return sub order
     */
    List<SubOrder> getSubOrdersByOrder(String orderId);
}
