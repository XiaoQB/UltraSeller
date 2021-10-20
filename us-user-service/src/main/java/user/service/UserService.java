package user.service;

import user.domain.entity.User;

public interface UserService {
    User findByUsername(String userName);

    String insertUser(User user);

    String logout(String userName);
}
