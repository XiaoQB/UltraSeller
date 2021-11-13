package cn.edu.fudan.user.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 前端所需参数：token+user_id
 * @author xiaoqb
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginDTO {
    Integer userId;
    String token;
}
