package Controller;

import DAO.UserDao;
import Model.User;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexController {

    @Autowired
    UserDao userDao = null;

    @RequestMapping("*")
    public ModelAndView helloWorld(Principal principal) {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("title", "Курьерская служба");
        
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
        mav.addObject("dateTimeNow", dateFormat.format(date));
        
        if (principal != null) {
            String userName = SecurityContextHolder.getContext().getAuthentication().getName();
            mav.addObject("authUser", userDao.getByLogin(userName));
        }

        return mav;
    }
}
