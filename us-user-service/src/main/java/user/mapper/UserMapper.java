package user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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

    Integer deleteAdmin(Integer id);

    Integer deleteBuyer(Integer id);

    Integer deleteSaler(Integer id);

    Integer updateAdmin(String userName,String password);
    
    Integer updateBuyerUserName(Integer id,String userName);

    Integer updateBuyerPassword(Integer id,String password);

    Integer updateBuyerEmail(Integer id,String email);

    Integer updateBuyerPhone(Integer id,String phone);

    Integer updateSalerUserName(Integer id,String userName);

    Integer updateSalerPassword(Integer id,String password);

    Integer updateSalerEmail(Integer id,String email);

    Integer updateSalerPhone(Integer id,String phone);
    
    Integer getAdminNum();

    Integer getBuyerNum();

    Integer getSalerNum();
    


}
