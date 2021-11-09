package user.domain.apimodel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author beethoven
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginInfo {

    private String userName;
    private String password;
    /**
     * 买家 卖家 管理员
     */
    private String role;

}
