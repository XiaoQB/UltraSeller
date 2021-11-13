package cn.edu.fudan.common.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {

    private String uid;
    private List<Commodity> goods_list;

}
