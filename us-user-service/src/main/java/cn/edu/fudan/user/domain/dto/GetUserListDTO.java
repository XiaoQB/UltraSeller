package cn.edu.fudan.user.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import cn.edu.fudan.user.domain.entity.User;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GetUserListDTO {
    Integer num;
    List<User> userList;
}
