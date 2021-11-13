package cn.edu.fudan.user.mapper;

import cn.edu.fudan.common.entities.dbo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {


    boolean insertAdmin(@Param("userName") String userName, @Param("password") String password);

    boolean insertSaler(@Param("userName") String userName, @Param("email") String email, @Param("phone") String phone, @Param("password") String password);

    boolean insertBuyer(@Param("userName") String userName, @Param("email")String email, @Param("phone")String phone, @Param("password")String password);

    Integer isExistAdmin(@Param("userName") String userName);

    Integer isExistSaler(@Param("userName") String userName);

    Integer isExistBuyer(@Param("userName") String userName);

    User getAdminByName(@Param("userName") String userName);

    User getBuyerByName(@Param("userName") String userName);

    User getSalerByName(@Param("userName") String userName);

    List<User> getAdmins(@Param("num")Integer num, @Param("page")Integer page);

    List<User> getBuyers(@Param("num") Integer num, @Param("page") Integer page);

    List<User> getSalers(@Param("num") Integer num,@Param("page") Integer page);

    Integer deleteAdmin(@Param("id")Integer id);

    Integer deleteBuyer(@Param("id")Integer id);

    Integer deleteSaler(@Param("id")Integer id);

    Integer updateAdmin(@Param("userName") String userName, @Param("password")String password);

    Integer updateBuyerUserName(@Param("id")Integer id, @Param("userName") String userName);

    Integer updateBuyerPassword(@Param("id")Integer id,@Param("password") String password);

    Integer updateBuyerEmail(@Param("id")Integer id,@Param("email") String email);

    Integer updateBuyerPhone(@Param("id")Integer id, @Param("phone")String phone);

    Integer updateSalerUserName(@Param("id")Integer id,@Param("userName")  String userName);

    Integer updateSalerPassword(@Param("id")Integer id, @Param("password")String password);

    Integer updateSalerEmail(@Param("id")Integer id, @Param("email")String email);

    Integer updateSalerPhone(@Param("id")Integer id, @Param("phone")String phone);

    Integer getAdminNum();

    Integer getBuyerNum();

    Integer getSalerNum();


}
