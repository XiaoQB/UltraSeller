package order.kafka;


import cn.edu.fudan.common.entities.dbo.SubOrder;
import com.fasterxml.jackson.databind.ObjectMapper;
import order.dao.MessageDao;
import order.entities.dto.SubOrderDTO;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
@Component
public class KafkaConsumer {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Resource
    private MessageDao messageDao;

    @KafkaListener(groupId = "default", topics = {"payment"})
    public void onMessage1(ConsumerRecord<?, ?> record) throws IOException {
        //消费的哪个topic、partition的消息,打印出消息内容
        SubOrderDTO subOrder = objectMapper.readValue(record.value().toString(), SubOrderDTO.class);
        System.out.println("消费message：" + record.topic() + "-" + record.partition() + "-" + record.value());
        messageDao.saveMessage(subOrder);
    }

    @KafkaListener(groupId = "default", topics = {"receive"})
    public void onMessage2(ConsumerRecord<?, ?> record) throws IOException {
        //消费的哪个topic、partition的消息,打印出消息内容
        String v = record.value().toString();
        SubOrderDTO subOrder = objectMapper.readValue(record.value().toString(), SubOrderDTO.class);
        messageDao.saveMessage(subOrder);
        System.out.println("消费message：" + record.topic() + "-" + record.partition() + "-" + record.value());
    }

    @KafkaListener(groupId = "default", topics = {"complete"})
    public void onMessage3(ConsumerRecord<?, ?> record) throws IOException {
        //消费的哪个topic、partition的消息,打印出消息内容
        String v = record.value().toString();
        SubOrderDTO subOrder = objectMapper.readValue(record.value().toString(), SubOrderDTO.class);
        messageDao.saveMessage(subOrder);
        System.out.println("消费message：" + record.topic() + "-" + record.partition() + "-" + record.value());
    }
}
