package user.result;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class R<T> {

    private int code;
    private String msg;
    private T data;// 数据

}
