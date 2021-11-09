package cn.edu.fudan.common.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author beethoven
 * @date 2021-11-02 16:21:39
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ResponseEntity<T> {

    private int code;
    private String msg;
    private T data;

}
