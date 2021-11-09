package user.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private String userName;
    private String password;
    private LocalDateTime updateTime;
    private LocalDateTime createTime;
    private String phone;
    private String email;
    private String role;
    private Integer id;

}
