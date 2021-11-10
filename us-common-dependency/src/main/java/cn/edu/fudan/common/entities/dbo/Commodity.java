package cn.edu.fudan.common.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author beethoven
 * @date 2021-11-02 16:16:45
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Commodity {

    private String id;
    private String name;
    private String imgLink;
    private float price;
    private String description;
    private long inventory;
    private String vendorName;
    private String keywords;
    private List<String> typeList;
    private Integer typeIdx;
    private Integer num;

}
