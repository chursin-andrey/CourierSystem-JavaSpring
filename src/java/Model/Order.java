package Model;

import java.util.Date;

public class Order {

    private Integer id;
    private Date delivery_start_time;
    private Date delivery_stop_time;
    private String sender_name;
    private String sender_address;
    private String recipient_name;
    private String recipient_address;
    private Integer courier_id;
    private Integer user_id;
    private Double length;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Date getDelivery_start_time() {
        return delivery_start_time;
    }

    public void setDelivery_start_time(Date delivery_start_time) {
        this.delivery_start_time = delivery_start_time;
    }

    public Date getDelivery_stop_time() {
        return delivery_stop_time;
    }

    public void setDelivery_stop_time(Date delivery_stop_time) {
        this.delivery_stop_time = delivery_stop_time;
    }

    public String getSender_name() {
        return sender_name;
    }

    public void setSender_name(String sender_name) {
        this.sender_name = sender_name;
    }

    public String getSender_address() {
        return sender_address;
    }

    public void setSender_address(String sender_address) {
        this.sender_address = sender_address;
    }

    public String getRecipient_name() {
        return recipient_name;
    }

    public void setRecipient_name(String recipient_name) {
        this.recipient_name = recipient_name;
    }

    public String getRecipient_address() {
        return recipient_address;
    }

    public void setRecipient_address(String recipient_address) {
        this.recipient_address = recipient_address;
    }

    public Integer getCourier_id() {
        return courier_id;
    }

    public void setCourier_id(Integer courier_id) {
        this.courier_id = courier_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Double getLength() {
        return length;
    }

    public void setLength(Double length) {
        this.length = length;
    }
}
