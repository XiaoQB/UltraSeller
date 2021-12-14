package order.entities.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
@EqualsAndHashCode(callSuper = false)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageResult implements Serializable {

    private Integer total;
    private List<?> rows;

}

