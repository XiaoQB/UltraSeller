package user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import user.domain.entity.User;

import java.util.List;



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

    List<User> getAdmins(Integer num, Integer page);

    List<User> getBuyers(Integer num,Integer page);

    List<User> getSalers(Integer num,Integer page);

    Integer deleteAdmin(String username);

    Integer deleteBuyer(String username);

    Integer deleteSaler(String username);

}
