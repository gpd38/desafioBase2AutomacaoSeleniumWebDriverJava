package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class RoadmapPage extends PageBase {

	// Mapping Roadmap
	By pageRoadmapInfo = By.xpath("//p[@class='lead'][contains(.,'No Roadmap information available.')]");

	// Actions
	public String returnPageRoadmapInformation() {
		return getText(pageRoadmapInfo);
	}

}
