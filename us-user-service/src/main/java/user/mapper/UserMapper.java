package user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import user.domain.entity.User;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface UserMapper {

    /**
     * @param num 每页数量
     * @param page 第几页
     * @return list of buyers
     */
    List<Map<Object,Object>> getUserListPaging(@Param("num")int num, @Param("page")int page);

    List<User> getUserListPaging1(@Param("num")int num, @Param("page")int page);

    String getTest();
}
