package user.service;

import user.domain.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User findByUsername(String userName);

    List<Map<Object,Object>> getUserListPaging(int num, int page);

    List<User> getUserListPaging1(int num, int page);

    String getTest();
}
