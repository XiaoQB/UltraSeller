package order.dao;

import order.entities.dto.SubOrderDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MessageDao {

    void saveMessage(@Param("subOrder") SubOrderDTO subOrder);
}
