package user.service;

import user.domain.entity.User;


public interface UserService {

    boolean insertUser(User user);

    String logout(String userName);

    String findByUsername(String userName, String password, String role);

}
