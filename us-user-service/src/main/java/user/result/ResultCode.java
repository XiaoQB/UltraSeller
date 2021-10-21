package user.result;

import lombok.*;

@Getter
@ToString
@AllArgsConstructor
public enum ResultCode {
    /* 成功状态码 */
    SUCCESS(200, "成功"),

    SERVICE_ERROR(500, "服务器内部错误"),

    /* 权限错误：70001-79999 */
    PERMISSION_NO_ACCESS(400, "无访问权限"),

    REGISTER_FAIL(401, "注册失败"),
    LOGIN_FAIL(402, "登录失败"),
    QUERY_FAIL(403,"查询失败"),
    DELETE_FAIL(406,"删除失败"),
    MODIFY_FAIL(407,"修改失败");
    private Integer code;
    private String message;

}
