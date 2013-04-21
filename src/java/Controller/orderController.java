package Controller;

import DAO.OrderDao;
import DAO.UserDao;
import Model.Order;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class orderController {
    
    @Autowired
    OrderDao orderDao = null;
    
    @Autowired
    UserDao userDao = null;
    
    @RequestMapping("/order")
    public ModelAndView orderView(
            Principal principal,
            @RequestParam("sender_name") String sender_name,
            @RequestParam("sender_address") String sender_address,
            @RequestParam("recipient_name") String recipient_name,
            @RequestParam("recipient_address") String recipient_address,
            @RequestParam("start_date") String start_date,
            @RequestParam("stop_date") String stop_date,
            @RequestParam("user_id") String user_id,
            @RequestParam("length") String length) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order");
        
        mav.addObject("title", "Новый заказ");
        
        if (principal != null) {
            String userName = SecurityContextHolder.getContext().getAuthentication().getName();
            mav.addObject("authUser", userDao.getByLogin(userName));
        }
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");         
        Date _start_date = new Date();
        Date _stop_date = new Date();
        
        try {
            _start_date = dateFormat.parse(start_date);
            _stop_date = dateFormat.parse(stop_date);
        } catch (ParseException ex) {
            Logger.getLogger(orderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Order order = new Order();
        order.setDelivery_start_time(_start_date);
        order.setDelivery_stop_time(_stop_date);
        order.setSender_name(sender_name);
        order.setSender_address(sender_address);
        order.setRecipient_name(recipient_name);
        order.setRecipient_address(recipient_address);
        if (!"null".equals(user_id)) {
            order.setUser_id(Integer.parseInt(user_id));
        }
        order.setLength(Double.parseDouble(length));
        
        order.setId(orderDao.insert(order));
        
        mav.addObject("order", order);
        
        
        return mav;
    }
    
    @RequestMapping("/order/searсh")
    public ModelAndView orderSearchView(
            Principal principal,
            @RequestParam("order_id") String order_id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order");
        
        mav.addObject("title", "Найти заказ");
        
        if (principal != null) {
            String userName = SecurityContextHolder.getContext().getAuthentication().getName();
            mav.addObject("authUser", userDao.getByLogin(userName));
        }
        
        Order order = orderDao.getById(Integer.parseInt(order_id));
        
        mav.addObject("order", order);
        
        return mav;
    }
    
    @RequestMapping("/order/{order_id}")
    public ModelAndView orderIdView(
            Principal principal,
            @PathVariable("order_id") String order_id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order");
        
        if (principal != null) {
            String userName = SecurityContextHolder.getContext().getAuthentication().getName();
            mav.addObject("authUser", userDao.getByLogin(userName));
        }
        
        Order order = orderDao.getById(Integer.parseInt(order_id));
        mav.addObject("title", "Заказ № " + order.getId());
        mav.addObject("order", order);
        
        return mav;
    }
    
    
    
}
