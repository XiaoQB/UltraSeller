package user.service;

import user.domain.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    boolean insertUser(User user);

    String logout(String userName);

    String findByUsername(String userName, String password, String role);

    List<User> getUserList(String role,Integer num,Integer page);

    Integer deleteUser(String role,String username);

}
