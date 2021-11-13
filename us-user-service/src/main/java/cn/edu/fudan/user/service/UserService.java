package cn.edu.fudan.user.service;

import cn.edu.fudan.common.entities.dbo.User;
import cn.edu.fudan.user.domain.dto.LoginDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    boolean insertUser(User user);

    String logout(String userName);

    LoginDTO findByUsername(String userName, String password, String role);

    List<User> getUserList(String role, Integer num, Integer page);

    Integer getUserNum(String role);

    Integer deleteUser(String role, String username);

    Integer modifyUser(Integer id, String role, String userName, String password, String phone, String email);

    boolean authorization(String token, String role);

    User getUserByName(String role, String username);
}
