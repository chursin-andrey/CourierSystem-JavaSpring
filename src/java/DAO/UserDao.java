package DAO;

import Model.User;
import java.util.List;

public interface UserDao {

    void insert(User user);

    void update(User user);

    void delete(User user);

    User getById(Integer id);
    
    User getByLogin(String login);

    List<User> getAll();
    
    int getCount();
}
