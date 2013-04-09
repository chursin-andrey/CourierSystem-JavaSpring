package Controller;

import DAO.OrderDao;
import Model.Order;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class orderController {
    
    @Autowired
    OrderDao orderDao = null;
    
    @RequestMapping("/order")
    public ModelAndView orderView(
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
        
        Date date = new Date();
        
        Order order = new Order();
        order.setSender_name(sender_name);
        order.setSender_address(sender_address);
        order.setRecipient_name(recipient_name);
        order.setRecipient_address(recipient_address);
        order.setLength(Double.parseDouble(length));
        order.setDelivery_start_time(date);
        order.setDelivery_stop_time(date);
        
        mav.addObject("sender_name", sender_name);
        mav.addObject("sender_address", sender_address);
        mav.addObject("recipient_name", recipient_name);
        mav.addObject("recipient_address", recipient_address);
        mav.addObject("start_date", start_date);
        mav.addObject("stop_date", stop_date);
        mav.addObject("user_id", user_id);
        mav.addObject("length", length);
        return mav;
    }
    
    @RequestMapping("/order/searсh")
    public ModelAndView orderSearchView(
            @RequestParam("order_id") String order_id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("order");
        
        mav.addObject("title", "Найти заказ");
        
        mav.addObject("order_id", order_id);
        
        return mav;
    }
    
}
