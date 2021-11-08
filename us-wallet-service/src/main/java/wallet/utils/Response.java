package wallet.utils;

import lombok.*;

/**
 * The type Response.
 *
 * @param <T> the type parameter
 * @author tristonk
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Response<T> {

    private int code;
    private String msg;
    private T data;

}