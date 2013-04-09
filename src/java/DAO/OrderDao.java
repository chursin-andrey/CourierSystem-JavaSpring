package DAO;

import Model.Order;
import java.util.List;

public interface OrderDao {

    void insert(Order order);

    void update(Order order);

    void delete(Order order);

    Order getById(Integer id);

    List<Order> getAll();
}
