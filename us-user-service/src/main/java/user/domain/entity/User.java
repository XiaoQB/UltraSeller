package user.domain.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value="账号基础信息")
public class User extends BaseInfo {
    @ApiModelProperty(value = "姓名")
    private String userName;
    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;
//    private Timestamp updateTime;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;
//    private Timestamp createTime;
    private String phone;
    private String email;
}
