package order.service.impl;

import cn.edu.fudan.common.entities.dbo.SubOrder;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jdk.internal.org.objectweb.asm.tree.IincInsnNode;
import order.entities.dto.SubOrderDTO;
import order.service.KafkaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

/**
 * description:
 *
 * @author caoyufei
 * create:
 **/
@Service
public class KafkaServiceImpl implements KafkaService {

    @Autowired
    private KafkaTemplate<String, Object> kafkaTemplate;

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void sendPayMessage(SubOrder subOrder, Integer buyerId) throws JsonProcessingException {
        SubOrderDTO subOrderDTO = SubOrderDTO.builder().
                subOrderId(subOrder.getSubOrderId())
                .address(subOrder.getAddress())
                .commodityId(subOrder.getCommodityId())
                .commodityName(subOrder.getCommodityName())
                .num(subOrder.getNum())
                .price(subOrder.getPrice())
                .buyerId(buyerId)
                .salerId(subOrder.getSalerId())
                .status(subOrder.getStatus())
                .build();
        String s = objectMapper.writeValueAsString(subOrderDTO);
        kafkaTemplate.send("payment", s);
    }

    @Override
    public void sendReceiveMsg(SubOrder subOrder, Integer buyerId) throws JsonProcessingException {
        SubOrderDTO subOrderDTO = SubOrderDTO.builder().
                subOrderId(subOrder.getSubOrderId())
                .address(subOrder.getAddress())
                .commodityId(subOrder.getCommodityId())
                .commodityName(subOrder.getCommodityName())
                .num(subOrder.getNum())
                .price(subOrder.getPrice())
                .buyerId(buyerId)
                .salerId(subOrder.getSalerId())
                .status(subOrder.getStatus())
                .build();
        String s = objectMapper.writeValueAsString(subOrderDTO);
        kafkaTemplate.send("receive", s);
    }

    @Override
    public void sendCompleteMsg(SubOrder subOrder, Integer buyerId) throws JsonProcessingException {
        SubOrderDTO subOrderDTO = SubOrderDTO.builder().
                subOrderId(subOrder.getSubOrderId())
                .address(subOrder.getAddress())
                .commodityId(subOrder.getCommodityId())
                .commodityName(subOrder.getCommodityName())
                .num(subOrder.getNum())
                .price(subOrder.getPrice())
                .buyerId(buyerId)
                .salerId(subOrder.getSalerId())
                .status(subOrder.getStatus())
                .build();
        String s = objectMapper.writeValueAsString(subOrderDTO);
        kafkaTemplate.send("complete", s);
    }


}
