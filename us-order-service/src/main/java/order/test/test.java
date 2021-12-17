package order.test;

import java.util.HashMap;
import java.util.Map;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
public class test {
    public static void main(String[] args) throws Exception {
        Map<String, Object> stringObjectMap = new HashMap<>();
        stringObjectMap.put("货高",12.0);
        stringObjectMap.put("货长",12.0);
        stringObjectMap.put("货宽",12.0);
        stringObjectMap.put("体积",12.0);
        stringObjectMap.put("数量",12);
        stringObjectMap.put("货物名称","df");
        Goods good = new Goods();
        good = good.buildGoodFromObjectMap(stringObjectMap,1);
        System.out.println();

    }
}
