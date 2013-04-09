package DAO;

import Model.Courier;
import java.util.List;

public interface CourierDao {

    void insert(Courier courier);

    void update(Courier courier);

    void delete(Courier courier);

    Courier getById(Integer id);

    List<Courier> getAll();
    
}
