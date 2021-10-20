package user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import user.domain.entity.User;

@Repository
@Mapper
public interface UserMapper {

    boolean insertAdmin(String userName, String password);

    boolean insertSaler(String userName, String email, String phone, String password);

    boolean insertBuyer(String userName, String email, String phone, String password);

    Integer isExistAdmin(String userName);

    Integer isExistSaler(String userName);

    Integer isExistBuyer(String userName);

    User getAdminByName(String userName);

    User getBuyerByName(String userName);

    User getSalerByName(String userName);
}
