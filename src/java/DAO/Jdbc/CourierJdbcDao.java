package DAO.Jdbc;

import DAO.CourierDao;
import Model.Courier;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class CourierJdbcDao implements CourierDao {
    
    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedTemplate;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedTemplate = new NamedParameterJdbcTemplate(dataSource);
    }
    private RowMapper<Courier> rowMapper = new RowMapper<Courier>() {
        @Override
        public Courier mapRow(ResultSet rs, int rowNum) throws SQLException {
            Courier courier = new Courier();
            courier.setId(rs.getInt("id"));
            courier.setName(rs.getString("name"));
            return courier;
        }
    };
    
    @Override
    public void insert(Courier courier) {
        String sql = "INSERT INTO courier(`name`) VALUES(?)";
        jdbcTemplate.update(sql, getPreparedStatementSetter(courier));
    }

    @Override
    public void update(Courier courier) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(Courier courier) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Courier getById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Courier> getAll() {
        return jdbcTemplate.query("SELECT * FROM courier", rowMapper);
    }
    
    private PreparedStatementSetter getPreparedStatementSetter(final Courier courier) {
        return new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                int i = 0;
                ps.setString(++i, courier.getName());
                //ps.setInt(++i, courier.getId());
            }
        };
    }
}
