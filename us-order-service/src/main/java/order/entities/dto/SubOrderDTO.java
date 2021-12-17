package order.entities.dto;

import com.alibaba.fastjson.annotation.JSONPOJOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SubOrderDTO implements Serializable {

    protected String subOrderId;
    protected String orderId;
    protected String status;
    protected Float totalPrice;
    protected String address;
    protected Long salerId;
    protected String commodityId;
    protected String commodityName;
    protected Float price;
    protected Integer num;
    protected Date createTime;
    protected Date updateTime;
    protected Integer buyerId;
    protected String logistics;


}
