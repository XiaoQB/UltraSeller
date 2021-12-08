package order.service;

import cn.edu.fudan.common.entities.dbo.SubOrder;
import com.fasterxml.jackson.core.JsonProcessingException;

public interface KafkaService {

    void sendPayMessage(SubOrder subOrder, Integer buyerId) throws JsonProcessingException;

    void sendReceiveMsg(SubOrder subOrder, Integer buyerId) throws JsonProcessingException;

    void sendCompleteMsg(SubOrder subOrder, Integer buyerId) throws JsonProcessingException;
}
