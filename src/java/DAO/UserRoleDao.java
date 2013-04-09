package DAO;

import Model.UserRole;
import java.util.List;

public interface UserRoleDao {
    void insert(UserRole role);

    void update(UserRole role);

    void delete(UserRole role);

    UserRole getById(Integer id);

    List<UserRole> getAll();
}
