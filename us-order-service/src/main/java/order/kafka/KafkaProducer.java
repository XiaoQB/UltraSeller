package order.kafka;

import cn.edu.fudan.common.entities.dbo.SubOrder;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import order.entities.dto.CreateOrderDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

/**
 * @description:Kafka生产者
 * @author: keyon
 * @time: 2021/11/29 3:51 下午
 */
@Component
@Slf4j
public class KafkaProducer {
     @Autowired
     private KafkaTemplate<String, Object> kafkaTemplate;

     public void sendPayedMessage(SubOrder subOrder){
          String orderMessage = JSONObject.toJSONString(subOrder);
          JSONObject orderMessageJson = JSON.parseObject(orderMessage);
          kafkaTemplate.send("payment",orderMessageJson);
     }




}
