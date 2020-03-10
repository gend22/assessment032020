package my.com.subscription.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping(value = { "" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView subscribeLandingPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		model.setViewName("subscription/home");
		return model;
	}
	@RequestMapping(value = {"/view/create_subscription"}, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView create() {
		ModelAndView model = new ModelAndView();
		model.setViewName("subscription/view/create_subscription");
		return model;
	}
	@RequestMapping(value = {"/view/output_subscription"}, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView result() {
		ModelAndView model = new ModelAndView();
		model.setViewName("subscription/view/output_subscription");
		return model;
	}
}
