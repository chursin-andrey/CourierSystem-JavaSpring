package DAO;

import Model.Order;
import java.util.List;

public interface OrderDao {

    int insert(Order order);
    
    void update(Order order);

    void delete(Order order);

    Order getById(Integer id);
    
    List<Order> getByUser(Integer id);
    
    List<Order> getByNewOrder();
    
    List<Order> getByOldOrder();

    List<Order> getAll();
}
