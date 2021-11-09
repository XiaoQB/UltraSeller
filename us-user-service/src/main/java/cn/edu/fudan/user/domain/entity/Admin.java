package cn.edu.fudan.user.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {

    private String userName;
    private String password;
    private LocalDateTime updateTime;
    private LocalDateTime createTime;
}
