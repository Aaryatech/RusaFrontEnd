package com.ats.rusafronend.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.rusafronend.common.Constant;
import com.ats.rusafronend.model.ImageLink;
import com.ats.rusafronend.model.NewsDetails;


@Controller
@Scope("session")
public class ImageController {

RestTemplate rest = new RestTemplate();
	
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
			map.add("langId", langId);
			map.add("pageId", pageId);
			map.add("newsblogsId", newsblogsId);
			NewsDetails image = rest.postForObject(Constant.url + "/getNewsBlogById",map, NewsDetails.class);
			//List<ImageLink> imagList = new ArrayList<ImageLink>(Arrays.asList(image));
			System.out.println("list_new: "+image.toString());
			model.addObject("image", image); 
			model.addObject("getGallryImageURL", Constant.getGallryImageURL);
				 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	
}
