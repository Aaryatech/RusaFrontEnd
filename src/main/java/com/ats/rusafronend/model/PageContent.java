package com.ats.rusafronend.model;

import java.util.List;
 

public class PageContent {
	
	private int pageId;
	private String pageName;
	private String slugName;
	private int sectioinId;
	List<CmsContent> cmsContentList;
	List<FaqContent> faqContentList;
	List<DocumentUpload> documentUploadList;
	List<TestImonial> testImonialList;
	public int getPageId() {
		return pageId;
	}
	public void setPageId(int pageId) {
		this.pageId = pageId;
	}
	 
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	public List<CmsContent> getCmsContentList() {
		return cmsContentList;
	}
	public void setCmsContentList(List<CmsContent> cmsContentList) {
		this.cmsContentList = cmsContentList;
	}
	public List<FaqContent> getFaqContentList() {
		return faqContentList;
	}
	public void setFaqContentList(List<FaqContent> faqContentList) {
		this.faqContentList = faqContentList;
	}
	public String getSlugName() {
		return slugName;
	}
	public void setSlugName(String slugName) {
		this.slugName = slugName;
	}
	public List<DocumentUpload> getDocumentUploadList() {
		return documentUploadList;
	}
	public void setDocumentUploadList(List<DocumentUpload> documentUploadList) {
		this.documentUploadList = documentUploadList;
	}
	public int getSectioinId() {
		return sectioinId;
	}
	public void setSectioinId(int sectioinId) {
		this.sectioinId = sectioinId;
	}
	public List<TestImonial> getTestImonialList() {
		return testImonialList;
	}
	public void setTestImonialList(List<TestImonial> testImonialList) {
		this.testImonialList = testImonialList;
	}
	@Override
	public String toString() {
		return "PageContent [pageId=" + pageId + ", pageName=" + pageName + ", slugName=" + slugName + ", sectioinId="
				+ sectioinId + ", cmsContentList=" + cmsContentList + ", faqContentList=" + faqContentList
				+ ", documentUploadList=" + documentUploadList + ", testImonialList=" + testImonialList + "]";
	}

}