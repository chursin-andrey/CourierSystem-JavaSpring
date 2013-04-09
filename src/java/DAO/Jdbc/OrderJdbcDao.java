package DAO.Jdbc;

import DAO.OrderDao;
import Model.Order;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class OrderJdbcDao implements OrderDao {
    
    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedTemplate;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedTemplate = new NamedParameterJdbcTemplate(dataSource);
    }
    
    private RowMapper<Order> rowMapper = new RowMapper<Order>() {
        @Override
        public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setDelivery_start_time(rs.getDate("delivery_start_time"));
            order.setDelivery_stop_time(rs.getDate("delivery_stop_time"));
            order.setSender_name(rs.getString("sender_name"));
            order.setSender_address(rs.getString("sender_address"));
            order.setRecipient_name(rs.getString("recipient_name"));
            order.setRecipient_address(rs.getString("recipient_address"));
            order.setCourier_id(rs.getInt("courier_id"));
            order.setUser_id(rs.getInt("user_id"));
            order.setLength(rs.getDouble("length"));
            return order;
        }
    };

    @Override
    public void insert(Order order) {
        String sql = "INSERT INTO "
                + "order (delivery_start_time, delivery_stop_time, sender_name, sender_address, recipient_name, recipient_address, courier_id, user_id, length) "
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, order);
    }

    @Override
    public void update(Order order) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(Order order) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Order getById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Order> getAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
