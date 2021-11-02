package order.dao;

import order.entities.dbo.SubOrder;
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
}
