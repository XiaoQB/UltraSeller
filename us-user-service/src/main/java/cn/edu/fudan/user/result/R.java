package cn.edu.fudan.user.result;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class R<T> {

    private int code;
    private String msg;
    private T data;

}
