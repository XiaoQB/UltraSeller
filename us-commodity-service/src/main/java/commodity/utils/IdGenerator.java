package commodity.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class IdGenerator {
    public static String generateId(){
        String newId;
        SimpleDateFormat timeFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        newId = timeFormat.format(new Date(System.currentTimeMillis())) +
                String.valueOf(new Random().nextInt(100));
        return newId;
    }
}
