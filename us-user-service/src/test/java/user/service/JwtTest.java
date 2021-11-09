package user.service;

import com.alibaba.fastjson.JSON;
import io.jsonwebtoken.Claims;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import user.service.impl.UserServiceImpl;
import user.utils.JwtUtil;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@SpringBootTest
public class JwtTest {

    @Autowired
    private UserServiceImpl userService;


    @Test
    public void jwttest() throws Exception {
        Map<String, Object> info = new HashMap<String, Object>();
        //jwt载荷选择
        info.put("role", "admin");
        info.put("success", "SUCCESS");
        info.put("username", "admin");
        //生成令牌
        String jwt = JwtUtil.createJWT(UUID.randomUUID().toString(), JSON.toJSONString(info), null);
        Claims claims = JwtUtil.parseJWT(jwt);
        System.out.println(claims.toString());

    }


}
