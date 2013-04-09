package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class loginController {

    @RequestMapping("/login")
    public String login(ModelMap model) {
        return "login";
    }

    @RequestMapping("/logout")
    public ModelAndView logoutView() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }

    @RequestMapping("/login/fail")
    public ModelAndView loginFailView() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        mav.addObject("error", "true");
        return mav;
    }
}
