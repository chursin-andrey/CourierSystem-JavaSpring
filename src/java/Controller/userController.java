package Controller;

import DAO.OrderDao;
import DAO.UserDao;
import Model.Order;
import Model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class userController {

    @Autowired
    OrderDao orderDao = null;
    @Autowired
    UserDao userDao = null;

    @RequestMapping("/user")
    public ModelAndView userView(Object principal) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user");

        User user = null;

        if (principal != null) {
            String userName = SecurityContextHolder.getContext().getAuthentication().getName();
            user = userDao.getByLogin(userName);
            mav.addObject("authUser", user);
        }

        mav.addObject("title", "Личный кабинет " + user.getName());

        List<Order> orderList = orderDao.getByUser(user.getId());
        mav.addObject("orderList", orderList);

        return mav;
    }

    @RequestMapping("/user/edit")
    public String  userEditView(
            @RequestParam("login") String login,
            @RequestParam("name") String name,
            @RequestParam("password") String password,
            @RequestParam("re_password") String re_password, 
            Object principal) {

        User user = null;

        if (principal != null) {
            String userName = SecurityContextHolder.getContext().getAuthentication().getName();
            user = userDao.getByLogin(userName);
        }
        
        if (password.equals(re_password)) {
            user.setLogin(login);
            user.setName(name);
            if (!password.equals("")) {
                user.setPassword(password);
            }
            userDao.update(user);
        }
        
        return "redirect:/user";
    }
}
