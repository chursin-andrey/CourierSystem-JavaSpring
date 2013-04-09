package DAO.Jdbc;

import DAO.UserDao;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class UserJdbcDao implements UserDao {

    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedTemplate;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedTemplate = new NamedParameterJdbcTemplate(dataSource);
    }
    private RowMapper<User> rowMapper = new RowMapper<User>() {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setLogin(rs.getString("login"));
            user.setName(rs.getString("name"));
            user.setPassword(rs.getString("password"));
            user.setRole_id(rs.getInt("role_id"));
            return user;
        }
    };

    @Override
    public void insert(User user) {
        String sql = "INSERT INTO user(login, name, password, role_id) VALUES(?,?,?,?)";
        jdbcTemplate.update(sql, getPreparedStatementSetter(user));
    }

    @Override
    public void update(User user) {
        String sql = "UPDATE user SET id=?, login=?, name=?, password=?, role_id=? WHERE id=?";
        jdbcTemplate.update(sql, user);
    }

    @Override
    public void delete(User user) {
        jdbcTemplate.update("DELETE FROM user WHERE id=?", user.getId());
    }

    @Override
    public User getById(Integer id) {
        return jdbcTemplate.queryForObject("SELECT * FROM user WHERE id=?", rowMapper, id);
    }

    @Override
    public User getByLogin(String login) {
        return jdbcTemplate.queryForObject("SELECT * FROM user WHERE login=?", rowMapper, login);
    }

    @Override
    public List<User> getAll() {
        return jdbcTemplate.query("SELECT * FROM user", rowMapper);
    }

    @Override
    public int getCount() {
        return this.jdbcTemplate.queryForInt("SELECT count(*) FROM user");
    }

    private PreparedStatementSetter getPreparedStatementSetter(final User user) {
        return new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                int i = 0;
                ps.setString(++i, user.getLogin());
                ps.setString(++i, user.getName());
                ps.setString(++i, user.getPassword());
                ps.setInt(++i, user.getRole_id());
            }
        };
    }
}
