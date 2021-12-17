package order.test;

import java.util.Map;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
public class LoadingCalculationService {
    public Goods dataToGoods(Map<String, Object> stringObjectMap, int i) throws Exception {
        int j = i+1;
        Goods goods = new Goods();
        return goods.buildGoodFromObjectMap(stringObjectMap,j);
    }
}


