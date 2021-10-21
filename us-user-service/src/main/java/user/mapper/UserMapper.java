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

    Integer deleteAdmin(String userName);

    Integer deleteBuyer(String userName);

    Integer deleteSaler(String userName);

    Integer updateAdmin(String userName,String password);

    Integer updateBuyerPassword(String userName,String password);

    Integer updateBuyerEmail(String userName,String email);

    Integer updateBuyerPhone(String userName,String phone);

    Integer updateSalerPassword(String userName,String password);

    Integer updateSalerEmail(String userName,String email);

    Integer updateSalerPhone(String userName,String phone);



}
