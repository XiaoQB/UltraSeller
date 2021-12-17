package order.test;

import lombok.Data;
import org.springframework.util.StringUtils;

import java.util.Map;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
@Data
public class Goods {

    private String goodsName;
    private Double height;
    private Double width;
    private Double length;
    private Double volume;
    private Integer amount;

    private final static String HEIGHT = "货高";
    private final static String NAME = "货物名称";
    private final static String WIDTH = "货宽";
    private final static String LENGTH = "货长";
    private final static String VOLUME = "体积";
    private final static String AMOUNT = "数量";

    public Goods buildGoodFromObjectMap(Map<String, Object> stringObjectMap, int i) throws Exception {
        setNameFromMap(stringObjectMap, i);
        setLengthFromMap(stringObjectMap, i);
        setWidthFromMap(stringObjectMap, i);
        setHeightFromMap(stringObjectMap, i);
        setAmountFromMap(stringObjectMap, i);
        setVolumeFromMap(stringObjectMap, i);
        setNameFromMap(stringObjectMap, i);
        return this;
    }

    private void setNameFromMap(Map<String, Object> stringObjectMap, int i) throws Exception {
        assertEmptyValue(stringObjectMap, NAME, i);
        if (stringObjectMap.get(NAME).toString().length() > 50) {
            throw new ParameterValidException("第" + i + "行传的货物名称超出长度");
        }
        setGoodsName(stringObjectMap.get(NAME).toString());
    }

    private void setHeightFromMap(Map<String, Object> stringObjectMap, int i) throws Exception {
        assertEmptyValue(stringObjectMap, HEIGHT, i);
        assertDouble(stringObjectMap, HEIGHT, i);
        setHeight(new Double(stringObjectMap.get(HEIGHT).toString()));
    }

    private void setWidthFromMap(Map<String, Object> stringObjectMap, int i) throws Exception {
        assertEmptyValue(stringObjectMap, WIDTH, i);
        assertDouble(stringObjectMap, WIDTH, i);
        setWidth(new Double(stringObjectMap.get(WIDTH).toString()));
    }

    private void setLengthFromMap(Map<String, Object> stringObjectMap, int i) throws Exception {
        assertEmptyValue(stringObjectMap, LENGTH, i);
        assertDouble(stringObjectMap, LENGTH, i);
        setLength(new Double(stringObjectMap.get(LENGTH).toString()));
    }

    private void setVolumeFromMap(Map<String, Object> stringObjectMap, int i) throws Exception {
        assertEmptyValue(stringObjectMap, VOLUME, i);
        assertDouble(stringObjectMap, VOLUME, i);
        setVolume(new Double(stringObjectMap.get(VOLUME).toString()));
    }

    private void setAmountFromMap(Map<String, Object> stringObjectMap, int i) throws Exception {
        assertEmptyValue(stringObjectMap, AMOUNT, i);
        if (!isNumeric(stringObjectMap.get(AMOUNT).toString())) {
            throw new ParameterValidException("第" + i + "行上传的数量列错误");
        }
        setAmount(Integer.valueOf(stringObjectMap.get(AMOUNT).toString()));
    }

    private static void assertEmptyValue(Map<String, Object> stringObjectMap, String property, int i) throws Exception {
        if (StringUtils.isEmpty(stringObjectMap.get(property))) {
            throw new ParameterValidException("第" + i + "行传的" + property + "为空");
        }
    }

    private static void assertDouble(Map<String, Object> stringObjectMap, String property, int i) throws ParameterValidException {
        if (!isDouble(stringObjectMap.get(property).toString())) {
            throw new ParameterValidException("第" + i + "行上传的" + property + "数据错误");
        }
    }

    private static boolean isNumeric(String s) {
        return true;
    }

    private static boolean isDouble(String s) {
        return true;
    }

}


