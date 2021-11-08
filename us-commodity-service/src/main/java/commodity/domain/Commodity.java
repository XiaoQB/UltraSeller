package commodity.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.Id;

import javax.persistence.Entity;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "商品信息")
public class Commodity {
    @Id
    private String id;
    @ApiModelProperty(value = "商品名")
    public String name;
    @ApiModelProperty(value = "商品图片")
    private String imgLink;
    @ApiModelProperty(value = "价格")
    private float price;
    @ApiModelProperty(value = "介绍")
    private String description;
    @ApiModelProperty(value = "库存")
    private long inventory;
    @ApiModelProperty(value = "商家")
    private String vendorName;
    @ApiModelProperty(value = "关键字")
    private String keywords;
    @ApiModelProperty(value = "类型列表")
    private List<String> type_list;
    @ApiModelProperty(value = "当前商品类型编号")
    private Integer type_idx;
}
