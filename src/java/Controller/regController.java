package Controller;

import DAO.UserDao;
import Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class regController {

    @Autowired
    UserDao userDao = null;

    @RequestMapping("/reg")
    public String login(ModelMap model) {
        return "reg";
    }

    @RequestMapping("/reg/add")
    public ModelAndView orderView(
            @RequestParam("login") String login,
            @RequestParam("name") String name,
            @RequestParam("password") String password,
            @RequestParam("re_password") String re_password) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("reg");
        
        if (password.equals(re_password)) {
            User user = new User();
            user.setLogin(login);
            user.setName(name);
            user.setPasswordMD5(password);
            user.setRole_id(1);
            userDao.insert(user);
        }

        return mav;
    }
}
