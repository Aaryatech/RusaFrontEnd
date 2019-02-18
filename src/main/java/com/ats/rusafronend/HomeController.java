package com.ats.rusafronend;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rusafronend.common.Constant;
import com.ats.rusafronend.model.ImageLink;
import com.ats.rusafronend.model.Logo;
import com.ats.rusafronend.model.Maintainance;
import com.ats.rusafronend.model.SectionTree;
import com.ats.rusafronend.model.TopMenuList; 
 

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		
		 
		
		RestTemplate rest = new RestTemplate();
		try {
			int langId=1;
			 
			HttpSession session = request.getSession();
			    
			try {
			 langId = (Integer) session.getAttribute("langId");
			}catch(Exception e) {
				//e.printStackTrace();
				session.setAttribute("langId",langId);
			}
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("langId", langId);
			 
			TopMenuList sectionTree = rest.postForObject(Constant.url + "/getTopMenuList",map,  TopMenuList.class);
			 
		  
			ImageLink[] image = rest.getForObject(Constant.url + "/getAllImageLinkList", ImageLink[].class);
			List<ImageLink> imagList = new ArrayList<ImageLink>(Arrays.asList(image));
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("id", 1); 
			Logo logo = rest.postForObject(Constant.url + "/getLogoListById", map, Logo.class);
			session.setAttribute("logo", logo);
			session.setAttribute("logoUrl", Constant.getLgogImageURL);
			 
			session.setAttribute("image", imagList); 
			session.setAttribute("url", Constant.getBannerImageURL);
			session.setAttribute("mapping","/");
		session.setAttribute("menuList",sectionTree);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "home";
	}
	
	@RequestMapping(value = "/changeLangage/{url}", method = RequestMethod.GET)
	public String changeLangage(@PathVariable("url")String url , HttpServletRequest request, HttpServletResponse response) {

		String[] arry = url.split("-");
		
		try {
			System.out.println(url);
			System.out.println(Arrays.toString(arry));
			
			
			HttpSession session = request.getSession();
			session.setAttribute("langId",Integer.parseInt(arry[0]));
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("langId", arry[0]);
			RestTemplate rest = new RestTemplate();
			TopMenuList sectionTree = rest.postForObject(Constant.url + "/getTopMenuList",map,  TopMenuList.class);
			 
			   
			session.setAttribute("menuList",sectionTree);
			
			Maintainance maintainance = rest.getForObject(Constant.url + "/checkIsMaintenance", Maintainance.class); 
			session.setAttribute("maintainance",maintainance);
		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			
			String ret = new String();
			ret=arry[1]+"/";
			for(int i=2 ; i<arry.length ; i++) {
				
				if(i==2) {
					ret=ret+arry[i];
				}else {
					ret=ret+"-"+arry[i];
				}
				
			}
			
		return "redirect:/"+ret;
		}catch(Exception e) {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value = "/checkMaintainance", method = RequestMethod.GET)
	public@ResponseBody Maintainance checkMaintainance(HttpServletRequest request, HttpServletResponse response) {

	 
		RestTemplate rest = new RestTemplate();
		Maintainance maintainance = new Maintainance();
		
		try {
			 System.out.println("in Maintainance ");
			HttpSession session = request.getSession();
			 
			 maintainance = rest.getForObject(Constant.url + "/checkIsMaintenance",  Maintainance.class); 
			session.setAttribute("maintainance",maintainance);
		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maintainance; 
	}
	
	@RequestMapping(value = "/siteInMaintainance", method = RequestMethod.GET)
	public ModelAndView siteInMaintainance(HttpServletRequest request, HttpServletResponse response) {

	 
		 
		ModelAndView model = new ModelAndView("maintainance");
		
		try {
			 
		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model; 
	}
}
