package user.dao;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import user.domain.entity.User;
import user.mapper.UserMapper;

import java.util.ArrayList;
import java.util.List;

@Repository
@Slf4j
public class UserDao {

    @Autowired
    private UserMapper userMapper;

    public boolean insertUser(User user, String password) {
        String role = user.getRole();
        boolean exist = false;
        try {
            switch (role) {
                case "admin":
                    exist = userMapper.isExistAdmin(user.getUserName()) > 0;
                    if (exist) return false;
                    userMapper.insertAdmin(user.getUserName(), password);
                    break;
                case "saler":
                    exist = userMapper.isExistSaler(user.getUserName()) > 0;
                    if (exist) return false;
                    userMapper.insertSaler(user.getUserName(), user.getEmail(), user.getPhone(), password);
                    break;
                case "buyer":
                    exist = userMapper.isExistBuyer(user.getUserName()) > 0;
                    if (exist) return false;
                    userMapper.insertBuyer(user.getUserName(), user.getEmail(), user.getPhone(), password);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            log.info("插入用户失败");
            return false;
        }
        return true;
    }


    public User getUserbyName(String userName, String role) {
        User user = new User();
        switch (role) {
            case "admin":
                user = userMapper.getAdminByName(userName);
                break;
            case "buyer":
                user = userMapper.getBuyerByName(userName);
                break;
            case "saler":
                user = userMapper.getSalerByName(userName);
            default:
                break;
        }
        return user;
    }

    public List<User> getUserList(String role, Integer num, Integer page) {
        List<User> users = new ArrayList<>();
        switch (role) {
            case "admin":
                users = userMapper.getAdmins(num, page);
                break;
            case "buyer":
                users = userMapper.getBuyers(num, page);
                break;
            case "saler":
                users = userMapper.getSalers(num, page);
                break;
            default:
                break;
        }
        return users;
    }

    public Integer deleteUser(String role, String username) {
        Integer integer = 0;
        switch (role) {
            case "admin":
                integer = userMapper.deleteAdmin(username);
                break;
            case "buyer":
                integer = userMapper.deleteBuyer(username);
                break;
            case "saler":
                integer = userMapper.deleteSaler(username);
                break;
            default:
                break;
        }
        return integer;
    }

    public Integer modifyUser(String userName, String newData, String type, String role) {
        Integer integer = 0;
        switch (role) {
            case "admin":
                integer = userMapper.updateAdmin(userName, newData);
                break;
            case "buyer":
                switch (type) {
                    case "password":
                        integer = userMapper.updateBuyerPassword(userName, newData);
                        break;
                    case "phone":
                        integer = userMapper.updateBuyerPhone(userName, newData);
                        break;
                    case "email":
                        integer = userMapper.updateBuyerEmail(userName, newData);
                        break;
                    default:
                        break;
                }
                break;
            case "saler":
                switch (type) {
                    case "password":
                        integer = userMapper.updateSalerPassword(userName, newData);
                        break;
                    case "phone":
                        integer = userMapper.updateSalerPhone(userName, newData);
                        break;
                    case "email":
                        integer = userMapper.updateSalerEmail(userName, newData);
                        break;
                    default:
                        break;
                }
                break;
            default:
                break;
        }
        return integer;
    }

}
