package user.service;

import user.domain.entity.User;

import java.util.List;

public interface UserService {

    boolean insertUser(User user);

    String logout(String userName);

    String findByUsername(String userName, String password, String role);

    List<User> getUserList(String role, Integer num, Integer page);

    Integer getUserNum(String role);

    Integer deleteUser(String role,Integer id);

    Integer modifyUser(Integer id, String role, String userName, String password, String phone, String email);

    boolean authorization(String token, String role);
}
