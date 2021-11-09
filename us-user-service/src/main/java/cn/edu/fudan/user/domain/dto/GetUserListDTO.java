package cn.edu.fudan.user.domain.dto;

import cn.edu.fudan.common.entities.dbo.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GetUserListDTO {
    Integer num;
    List<User> userList;
}
