package Controller;

import DAO.CourierDao;
import DAO.OrderDao;
import DAO.UserDao;
import Model.Courier;
import Model.User;
import Model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adminController {
    
    @Autowired
    OrderDao orderDao = null;
    @Autowired
    UserDao userDao = null;
    @Autowired
    CourierDao courierDao = null;

    @RequestMapping("/admin")
    public ModelAndView adminView(Object principal) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin");

        User user = null;
        
        if (principal != null) {
            String userName = SecurityContextHolder.getContext().getAuthentication().getName();
            user = userDao.getByLogin(userName);
            mav.addObject("authUser", user);
        }

        mav.addObject("title", "Панель администратора");

        mav.addObject("newOrderList", orderDao.getByNewOrder());
        mav.addObject("oldOrderList", orderDao.getByOldOrder());
        mav.addObject("userList", userDao.getAll());
        mav.addObject("courierList", courierDao.getAll());
        
        return mav;
    }
    
    @RequestMapping(value="/admin/add", method=RequestMethod.POST)
    public String adminAddView(@RequestParam("name") String name, Object principal)
    {    
        Courier courier = new Courier();
        courier.setName(name);
        courierDao.insert(courier);
        
        return "redirect:/admin";
    }
    
    @RequestMapping(value="/admin/edit", method=RequestMethod.POST)
    public String adminEditView(
            @RequestParam("orderId") String orderId,
            @RequestParam("courierId") String courierId,
            Object principal)
    {
        Order order = orderDao.getById(Integer.parseInt(orderId));
        order.setCourier_id(Integer.parseInt(courierId));
        orderDao.update(order);
        return "redirect:/admin";
    }
}
