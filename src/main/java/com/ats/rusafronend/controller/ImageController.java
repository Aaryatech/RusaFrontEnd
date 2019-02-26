package com.ats.rusafronend.controller;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rusafronend.common.Constant;
import com.ats.rusafronend.model.ImageLink;
import com.ats.rusafronend.model.NewsBlog;
import com.ats.rusafronend.model.NewsDetails;
import com.ats.rusafronend.model.PageMetaData;
import com.ats.rusafronend.model.TestImonial;
import com.ats.rusafronend.model.TopMenuList;
import com.ats.rusafronend.model.ContactUs;

@Controller
@Scope("session")
public class ImageController {

RestTemplate rest = new RestTemplate();
ContactUs contactUs=new ContactUs();
 	@RequestMapping(value = "/NewsDetails/{langId}/{pageId}/{newsblogsId}", method = RequestMethod.GET)
	public ModelAndView getImageLink(@PathVariable int langId, @PathVariable int pageId,@PathVariable int newsblogsId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("content/NewsDetails");
		try {
		/*	HttpSession session = request.getSession();
			session.setAttribute("mapping","info-"+slugName);
			int langId = (Integer) session.getAttribute("langId");
			System.out.println(slugName);
			*/
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("langId",langId);
			TopMenuList sectionTree = rest.postForObject(Constant.url + "/getTopMenuList", map, TopMenuList.class);
			model.addObject("menuList", sectionTree);
			
			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("langId", langId);
			map1.add("pageId", pageId);
			map1.add("newsblogsId", newsblogsId);
			NewsDetails image = rest.postForObject(Constant.url + "/getNewsBlogById",map1, NewsDetails.class);
			//List<ImageLink> imagList = new ArrayList<ImageLink>(Arrays.asList(image));
			System.out.println("list_new: "+image.toString());
			model.addObject("image", image); 
			model.addObject("getGallryImageURL", Constant.getGallryImageURL);
				 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/ContactUs", method = RequestMethod.GET)
	public ModelAndView ContactUs(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("content/contactUs");
		try {
			
			HttpSession session = request.getSession();
			session.setAttribute("mapping","ContactUs");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("slugName", "ContactUs");
			PageMetaData pageMetaData = rest.postForObject(Constant.url + "/getPageMetaData",map,  PageMetaData.class);
			model.addObject("pageMetaData", pageMetaData);
				 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/teamDetails", method = RequestMethod.GET)
	public ModelAndView teamDetails(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("content/teamDetails");
		try {
				int langId = 1;

				HttpSession session = request.getSession();

				try {
					langId = (Integer) session.getAttribute("langId");
				} catch (Exception e) {
					// e.printStackTrace();
					session.setAttribute("langId", langId);
				}

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("langId", langId);

				TopMenuList sectionTree = rest.postForObject(Constant.url + "/getTopMenuList", map, TopMenuList.class);
			
			//HttpSession session = request.getSession();
				session.setAttribute("menuList", sectionTree);
			session.setAttribute("mapping","teamDetails");
			
			TestImonial[] getTeamList= rest.getForObject(Constant.url + "/getTeamDetail",TestImonial[].class);
			List<TestImonial> teamList = new ArrayList<TestImonial>(Arrays.asList(getTeamList));
			model.addObject("teamList", teamList);
			model.addObject("gallryImageURL", Constant.getGallryImageURL);

			
			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("slugName", "teamDetails");
			PageMetaData pageMetaData = rest.postForObject(Constant.url + "/getPageMetaData",map1,  PageMetaData.class);
			model.addObject("pageMetaData", pageMetaData);
				 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	@RequestMapping(value = "/insertContactUs", method = RequestMethod.POST)
	public String insertContactUs(HttpServletRequest request,HttpServletResponse response) {

		 try {
			 	String name = request.getParameter("name");
			 	String email = request.getParameter("email");
			 	String message = request.getParameter("message");
			 	String mobileNo = request.getParameter("mobileNo");
			
				Date date = new Date(); // your date
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				
				 // editImageLink.setIsActive(1);
				
				InetAddress addr = InetAddress.getByName(request.getRemoteAddr());
		        String hostName = addr.getHostName(); 
		        String userAgent = request.getHeader("User-Agent"); 
							contactUs.setIpAddress(hostName);
							contactUs.setUserAgent(userAgent);
							contactUs.setAddDate(sf.format(date));
							contactUs.setContactName(name);
							contactUs.setEmailId(email);
							contactUs.setMessage(message);
							contactUs.setMobileNo(mobileNo);
							contactUs.setStatusByAdmin(0);;
							//contactUs.setRemark(null);
							
          	ContactUs res = rest.postForObject(Constant.url + "/saveContactUs", contactUs, ContactUs.class);
						
						
		 }catch (Exception e) {
			e.printStackTrace();
		}
		 
	 return "redirect:/ContactUs";
	}
	
	@RequestMapping(value = "/readMore", method = RequestMethod.POST)
	public ModelAndView readMore(HttpServletRequest request,HttpServletResponse response) {

		ModelAndView model = new ModelAndView("content/readMore");
		try {
	
				 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
}
