package commodity.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author fdse
 */
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@ToString

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Response<T> {

    /**
     * 1 true, 0 false
     */
    Integer status;
    String msg;
    T data;

//    public Response(T i, T create_success, T student) {
//    }
}
