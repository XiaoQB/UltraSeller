package order.entities.enums;

/**
 * @author beethoven
 * @date 2021-11-12 14:13:15
 */
public enum OrderStatus {
    /**
     * 订单状态
     */
    WAIT_TO_PAY, WAIT_TO_TRANSFER, WAIT_TO_RECEIPT, CANCEL, COMPLETE;
}
