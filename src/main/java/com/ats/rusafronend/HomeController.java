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
import com.ats.rusafronend.model.BannerImages;
import com.ats.rusafronend.model.CMSPageDescription;
import com.ats.rusafronend.model.GallaryDetail;
import com.ats.rusafronend.model.ImageLink;
import com.ats.rusafronend.model.Logo;
import com.ats.rusafronend.model.Maintainance;
import com.ats.rusafronend.model.MetaData;
import com.ats.rusafronend.model.NewsDetails;
import com.ats.rusafronend.model.TestImonial;
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

			ImageLink[] image = rest.getForObject(Constant.url + "/getAllImageLinkList", ImageLink[].class);
			List<ImageLink> imagList = new ArrayList<ImageLink>(Arrays.asList(image));
			
			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("id", 3); 
			BannerImages editbanner = rest.postForObject(Constant.url + "/getSliderImagesById", map1, BannerImages.class);
			session.setAttribute("editbanner", editbanner);
			MultiValueMap<String, Object> map2 = new LinkedMultiValueMap<String, Object>();
			map2.add("id", 1);
			Logo logo = rest.postForObject(Constant.url + "/getLogoListById", map2, Logo.class);
		
			 
			GallaryDetail[] galleryDetail = rest.getForObject(Constant.url + "/getLastTenVideos",GallaryDetail[].class);
			List<GallaryDetail> gerGalleryList = new ArrayList<GallaryDetail>(Arrays.asList(galleryDetail));
			
			GallaryDetail[] photoDetail = rest.getForObject(Constant.url + "/getLastTenPhotos",GallaryDetail[].class);
			List<GallaryDetail> photoList = new ArrayList<GallaryDetail>(Arrays.asList(photoDetail));
			
			CMSPageDescription[] getCMSDescList = rest.postForObject(Constant.url + "/getCMSDescByExInt1", map,CMSPageDescription[].class);
			List<CMSPageDescription> getCMSDesc = new ArrayList<CMSPageDescription>(Arrays.asList(getCMSDescList));
			
			TestImonial[] testImonialList= rest.getForObject(Constant.url + "/getLastFiveTestImonials",TestImonial[].class);
			List<TestImonial> testImonial = new ArrayList<TestImonial>(Arrays.asList(testImonialList));
			
			NewsDetails[] getPagesModule = rest.postForObject(Constant.url + "/getLastFourNewsByLangId",map, NewsDetails[].class);			
			List<NewsDetails> newsBlogsList = new ArrayList<NewsDetails>(Arrays.asList(getPagesModule));
			
			session.setAttribute("newsBlogsList", newsBlogsList);	 
			session.setAttribute("testImonial", testImonial);
			session.setAttribute("getCMSDesc", getCMSDesc);
			session.setAttribute("photoList", photoList);
			session.setAttribute("videoGalleryDetail", gerGalleryList);
			session.setAttribute("logo", logo);
			session.setAttribute("logoUrl", Constant.getLgogImageURL);

			session.setAttribute("image", imagList);
			session.setAttribute("url", Constant.getBannerImageURL);
			session.setAttribute("mapping", "/");
			session.setAttribute("menuList", sectionTree);
			session.setAttribute("gallryImageURL", Constant.getGallryImageURL);
			
			session.setAttribute("siteFrontEndUrl", Constant.siteFrontEndUrl);
			session.setAttribute("siteDomainUrl", Constant.siteDomainUrl);
			
			MetaData metaData = rest.postForObject(Constant.url + "/getHomePageMetaDataByLangId", map,MetaData.class);
			session.setAttribute("homePageMetaData", metaData);
			
			System.out.println(metaData);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home";
	}

	@RequestMapping(value = "/changeLangage/{url}", method = RequestMethod.GET)
	public String changeLangage(@PathVariable("url") String url, HttpServletRequest request,
			HttpServletResponse response) {

		String[] arry = url.split("-");

		try {
			System.out.println(url);
			System.out.println(Arrays.toString(arry));

			HttpSession session = request.getSession();
			session.setAttribute("langId", Integer.parseInt(arry[0]));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("langId", arry[0]);
			RestTemplate rest = new RestTemplate();
			TopMenuList sectionTree = rest.postForObject(Constant.url + "/getTopMenuList", map, TopMenuList.class);

			session.setAttribute("menuList", sectionTree);

			Maintainance maintainance = rest.getForObject(Constant.url + "/checkIsMaintenance", Maintainance.class);
			session.setAttribute("maintainance", maintainance);

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {

			String ret = new String();
			ret = arry[1] + "/";
			for (int i = 2; i < arry.length; i++) {

				if (i == 2) {
					ret = ret + arry[i];
				} else {
					ret = ret + "-" + arry[i];
				}

			}

			return "redirect:/" + ret;
		} catch (Exception e) {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/checkMaintainance", method = RequestMethod.GET)
	public @ResponseBody Maintainance checkMaintainance(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		Maintainance maintainance = new Maintainance();

		try {
			System.out.println("in Maintainance ");
			HttpSession session = request.getSession();

			maintainance = rest.getForObject(Constant.url + "/checkIsMaintenance", Maintainance.class);
			session.setAttribute("maintainance", maintainance);

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

	@RequestMapping(value = "/retriveSession/{url}", method = RequestMethod.GET)
	public String retriveSession(@PathVariable("url") String url, HttpServletRequest request,
			HttpServletResponse response) {

		String[] arry = url.split("-");

		try {
			System.out.println(url);
			System.out.println(Arrays.toString(arry));

			HttpSession session = request.getSession();
			session.setAttribute("langId", 1);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("langId", 1);
			RestTemplate rest = new RestTemplate();
			TopMenuList sectionTree = rest.postForObject(Constant.url + "/getTopMenuList", map, TopMenuList.class);
			session.setAttribute("menuList", sectionTree);

			ImageLink[] image = rest.getForObject(Constant.url + "/getAllImageLinkList", ImageLink[].class);
			List<ImageLink> imagList = new ArrayList<ImageLink>(Arrays.asList(image));

			map = new LinkedMultiValueMap<String, Object>();
			map.add("id", 1);
			Logo logo = rest.postForObject(Constant.url + "/getLogoListById", map, Logo.class);
			session.setAttribute("logo", logo);
			session.setAttribute("logoUrl", Constant.getLgogImageURL);
			session.setAttribute("image", imagList);
			session.setAttribute("url", Constant.getBannerImageURL);
			
			session.setAttribute("siteFrontEndUrl", Constant.siteFrontEndUrl);
			session.setAttribute("siteDomainUrl", Constant.siteDomainUrl);
			
			Maintainance maintainance = rest.getForObject(Constant.url + "/checkIsMaintenance", Maintainance.class);
			session.setAttribute("maintainance", maintainance);
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("langId", 1);
			MetaData metaData = rest.postForObject(Constant.url + "/getHomePageMetaDataByLangId", map,MetaData.class);
			session.setAttribute("homePageMetaData", metaData);

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {

			String ret = new String();

			if (ArrayUtils.contains(arry, "info")) {
				ret = "info" + "/";
				for (int i = 1; i < arry.length; i++) {

					if (i == 1) {

						ret = ret + arry[i];
					} else {
						ret = ret + "-" + arry[i];
					}

				}

			} else {
				for (int i = 0; i < arry.length; i++) {

					if (i == 0) {

						ret = ret + arry[i];
					} else {
						ret = ret + "-" + arry[i];
					}

				}
			}
			System.out.println("ret" + ret);
			return "redirect:/" + ret;
		} catch (Exception e) {
			return "redirect:/";
		}
	}
}
