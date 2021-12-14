package order.entities.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
@EqualsAndHashCode(callSuper = false)
@Data
public class Notification implements Serializable {

    private Integer id;
    protected String type;
    protected String subOrderId;
    protected Float totalPrice;
    protected String address;
    protected Long salerId;
    protected Long buyerId;
    protected String commodityId;
    protected String commodityName;
    protected Float price;
    protected Integer num;
    protected Integer status;
    protected Date createTime;
    protected Date updateTime;


}
