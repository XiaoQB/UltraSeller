package user.service.impl;

import org.springframework.stereotype.Service;
import user.domain.entity.User;
import user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Override
    public User findByUsername(String userName) {
        return null;
    }
}
