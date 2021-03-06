package cn.edu.fudan.common.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author beethoven
 * @date 2021-11-02 16:14:38
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubOrder implements Serializable {

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

    protected String logistics;

}
