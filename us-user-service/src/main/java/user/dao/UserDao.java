package user.dao;

import lombok.experimental.PackagePrivate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import user.domain.entity.User;
import user.mapper.UserMapper;

@Repository
@Slf4j
public class UserDao {
    @Autowired
    private UserMapper userMapper;
    public boolean insertUser(User user, String password) {
        String role = user.getRole();
        boolean exist = false;
        try {
            switch (role){
                case "admin" :
                    exist = userMapper.isExistAdmin(user.getUserName()) > 0;
                    if(exist) return false;
                    userMapper.insertAdmin(user.getUserName(),password);
                    break;
                case "saler" :
                    exist = userMapper.isExistSaler(user.getUserName()) > 0;
                    if(exist) return false;
                    userMapper.insertSaler(user.getUserName(),user.getEmail(),user.getPhone(),password);
                    break;
                case "buyer" :
                    exist = userMapper.isExistBuyer(user.getUserName()) > 0;
                    if(exist) return false;
                    userMapper.insertBuyer(user.getUserName(),user.getEmail(),user.getPhone(),password);
                    break;
                default: break;
            }
        }catch (Exception e){
            log.info("插入用户失败");
            return false;
        }
        return true;
    }


    public User getUserbyName(String userName, String role) {
        User user = new User();
        switch (role){
            case "admin": user = userMapper.getAdminByName(userName);
            break;
            case "buyer": user = userMapper.getBuyerByName(userName);
            break;
            case "saler": user = userMapper.getSalerByName(userName);
            default:
                break;
        }
        return user;
    }
}
