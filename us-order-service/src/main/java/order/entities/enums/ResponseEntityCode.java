package order.entities.enums;

import lombok.Getter;

/**
 * @author beethoven
 * @date 2021-11-02 16:24:16
 */
@Getter
public enum ResponseEntityCode {
    /**
     * repose code enum
     */
    OK(200),
    ERROR(404);

    private final int code;

    ResponseEntityCode(int code) {
        this.code = code;
    }

}
