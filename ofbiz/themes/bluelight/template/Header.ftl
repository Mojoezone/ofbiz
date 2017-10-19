<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#assign externalKeyParam = "&amp;externalLoginKey=" + requestAttributes.externalLoginKey!>

<#if (requestAttributes.person)??><#assign person = requestAttributes.person></#if>
<#if (requestAttributes.partyGroup)??><#assign partyGroup = requestAttributes.partyGroup></#if>
<#assign docLangAttr = locale.toString()?replace("_", "-")>
<#assign langDir = "ltr">
<#if "ar.iw"?contains(docLangAttr?substring(0, 2))>
    <#assign langDir = "rtl">
</#if>
<html lang="${docLangAttr}" dir="${langDir}" xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${layoutSettings.companyName}: <#if (titleProperty)?has_content>${uiLabelMap[titleProperty]}<#else>${title!}</#if></title>
    
    <#if layoutSettings.shortcutIcon?has_content>
      <#assign shortcutIcon = layoutSettings.shortcutIcon/>
    <#elseif layoutSettings.VT_SHORTCUT_ICON?has_content>
      <#assign shortcutIcon = layoutSettings.VT_SHORTCUT_ICON.get(0)/>
    </#if>
    
    <#if shortcutIcon?has_content>
      <link rel="shortcut icon" href="<@ofbizContentUrl>${StringUtil.wrapString(shortcutIcon)}</@ofbizContentUrl>" />
    </#if>
    
    <#-- comment: requesting all js file under .VT_HDR_JAVASCRIPT -->
    
    <#if layoutSettings.VT_HDR_JAVASCRIPT?has_content>
        <#list layoutSettings.VT_HDR_JAVASCRIPT as javaScript>
            <script src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>" type="text/javascript"></script>
        </#list>
    </#if>
    
    <#if layoutSettings.javaScripts?has_content>
    
      <#--layoutSettings.javaScripts is a list of java scripts. -->
      <#-- use a Set to make sure each javascript is declared only once, but iterate the list to maintain the correct order -->
      
      <#assign javaScriptsSet = Static["org.apache.ofbiz.base.util.UtilMisc"].toSet(layoutSettings.javaScripts)/>
      <#list layoutSettings.javaScripts as javaScript>
        <#if javaScriptsSet.contains(javaScript)>
          <#assign nothing = javaScriptsSet.remove(javaScript)/>
          <script src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>" type="text/javascript"></script>
        </#if>
      </#list>
    </#if>
    

    <#if layoutSettings.styleSheets?has_content>
    
        <#--layoutSettings.styleSheets is a list of style sheets. So, you can have a user-specified "main" style sheet, AND a component style sheet.-->
        
        <#list layoutSettings.styleSheets as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    
    <#if layoutSettings.VT_STYLESHEET?has_content>
        <#list layoutSettings.VT_STYLESHEET as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    <#if layoutSettings.rtlStyleSheets?has_content && langDir == "rtl">
        <#--layoutSettings.rtlStyleSheets is a list of rtl style sheets.-->
        <#list layoutSettings.rtlStyleSheets as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    <#if layoutSettings.VT_RTL_STYLESHEET?has_content && langDir == "rtl">
        <#list layoutSettings.VT_RTL_STYLESHEET as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    <#if layoutSettings.VT_EXTRA_HEAD?has_content>
        <#list layoutSettings.VT_EXTRA_HEAD as extraHead>
            ${extraHead}
        </#list>
    </#if>
    <#if layoutSettings.WEB_ANALYTICS?has_content>
      <script language="JavaScript" type="text/javascript">
        <#list layoutSettings.WEB_ANALYTICS as webAnalyticsConfig>
          ${StringUtil.wrapString(webAnalyticsConfig.webAnalyticsCode!)}
        </#list>
      </script>
    </#if>
</head>

<#if layoutSettings.headerImageLinkUrl??>
  <#assign logoLinkURL = "${layoutSettings.headerImageLinkUrl}">
<#else>
  <#assign logoLinkURL = "${layoutSettings.commonHeaderImageLinkUrl}">
</#if>
<#assign organizationLogoLinkURL = "${layoutSettings.organizationLogoLinkUrl!}">

<#if person?has_content>
  <#assign userName = (person.firstName!) + " " + (person.middleName!) + " " + person.lastName!>
<#elseif partyGroup?has_content>
  <#assign userName = partyGroup.groupName!>
<#elseif userLogin??>
  <#assign userName = userLogin.userLoginId>
<#else>
  <#assign userName = "">
</#if>

<#if defaultOrganizationPartyGroupName?has_content>
  <#assign orgName = " - " + defaultOrganizationPartyGroupName!>
<#else>
  <#assign orgName = "">
</#if>

<body>
  <div id="wait-spinner" style="display:none">
    <div id="wait-spinner-image"></div>
  </div>
  <div class="container-fluid pl-0 pr-0">
    <div class="hidden" style="display:none">
      <a href="#column-container" title="${uiLabelMap.CommonSkipNavigation}" accesskey="2">
        ${uiLabelMap.CommonSkipNavigation}
      </a>
    </div>
    <div class="container-fluid">
      <ul class="row mb-0">
      
     <#if userLogin?has_content>
        <#if (userPreferences.COMPACT_HEADER)?default("N") == "Y">
            <#if shortcutIcon?has_content>
                <#if organizationLogoLinkURL?has_content>
                    <li class="col-lg-2 list-unstyled"><a href="<@ofbizUrl>${logoLinkURL}</@ofbizUrl>"><img class="img-thumbnail" alt="${layoutSettings.companyName}" src="<@ofbizContentUrl>${StringUtil.wrapString(organizationLogoLinkURL)}</@ofbizContentUrl>" height="16px" width="16px"></a></li>
                    <#else>
                    <li class="col-lg-2 list-unstyled"><a href="<@ofbizUrl>${logoLinkURL}</@ofbizUrl>"><img  class="img-thumbnail" src="<@ofbizContentUrl>${StringUtil.wrapString(shortcutIcon)}</@ofbizContentUrl>" height="16px" width="16px" alt="" /></a></li>
                </#if>
          </#if>
        <#else>
          <#if layoutSettings.headerImageUrl??>
            <#assign headerImageUrl = layoutSettings.headerImageUrl>
          <#elseif layoutSettings.commonHeaderImageUrl??>
            <#assign headerImageUrl = layoutSettings.commonHeaderImageUrl>
          <#elseif layoutSettings.VT_HDR_IMAGE_URL??>
            <#assign headerImageUrl = layoutSettings.VT_HDR_IMAGE_URL.get(0)>
          </#if>
          <#if headerImageUrl??>
                <#if organizationLogoLinkURL?has_content>
                    <li class="col-1 list-unstyled mt-2"><a href="<@ofbizUrl>${logoLinkURL}</@ofbizUrl>"><img class="img-thumbnail border-0" style="background-color:transparent" alt="${layoutSettings.companyName}" src="<@ofbizContentUrl>${StringUtil.wrapString(organizationLogoLinkURL)}</@ofbizContentUrl>"></a></li>
                    <#else>
                    <li class="col-1 list-unstyled mt-2"><a href="<@ofbizUrl>${logoLinkURL}</@ofbizUrl>"><img  class="img-thumbnail border-0" style="background-color:transparent" alt="${layoutSettings.companyName}" src="<@ofbizContentUrl>${StringUtil.wrapString(headerImageUrl)}</@ofbizContentUrl>"/></a></li>
                </#if>
          </#if>
          </#if>
          
          
          <#if layoutSettings.middleTopMessage1?has_content && layoutSettings.middleTopMessage1 != " ">
            <li class="col-3 list-unstyled small" style="display:none;">
            <div>
            <center>${layoutSettings.middleTopHeader!}</center>
            <a href="${layoutSettings.middleTopLink1!}">${layoutSettings.middleTopMessage1!}</a><br/>
            <a href="${layoutSettings.middleTopLink2!}">${layoutSettings.middleTopMessage2!}</a><br/>
            <a href="${layoutSettings.middleTopLink3!}">${layoutSettings.middleTopMessage3!}</a>
            </div>
            </li>
          </#if>
        </#if>
        
        <li class="col-11 list-unstyled list-inline-item small">
          <ul id="preferences-menu" class="list-inline-item float-right">
            <#if userLogin??>
              <#if userLogin.partyId??>
                <#assign size = companyListSize?default(0)>
                <#if size &gt; 1>
                    <#assign currentCompany = delegator.findOne("PartyNameView", {"partyId" : organizationPartyId}, false)>
                    <#if currentCompany?exists>
                        <li class="list-inline-item">
                            <a href="<@ofbizUrl>ListSetCompanies</@ofbizUrl>">${currentCompany.groupName} &nbsp;- </a>
                        </li>
                    </#if>
                </#if>
                <li class="list-inline-item""><a href="/partymgr/control/viewprofile?partyId=${userLogin.partyId}${externalKeyParam!}">${userName}</a></li>
              <#else>
                <li class="list-inline-item">${userName}</li>
              </#if>
              <#if orgName?has_content>              
                <li class="list-unstyled list-inline-item">${orgName}</li>
              </#if>
            </#if>
            <li class="list-unstyled list-inline-item"><a href="<@ofbizUrl>ListLocales</@ofbizUrl>">${uiLabelMap.CommonLanguageTitle} : ${locale.getDisplayName(locale)}</a></li>
            <#if userLogin??>
              <li class="list-unstyled list-inline-item"><a href="<@ofbizUrl>ListVisualThemes</@ofbizUrl>">${uiLabelMap.CommonVisualThemes}</a></li>
              <li class="list-unstyled list-inline-item"><a href="<@ofbizUrl>logout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a></li>
            <#else>
              <li class="list-unstyled list-inline-item"><a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">${uiLabelMap.CommonLogin}</a></li>
            </#if>
            <#--if webSiteId?? && requestAttributes._CURRENT_VIEW_?? && helpTopic??-->
            <#if parameters.componentName?? && requestAttributes._CURRENT_VIEW_?? && helpTopic??>
              <#include "component://common/template/includes/HelpLink.ftl" />
              <li class="list-unstyled list-inline-item"><a class="help-link <#if pageAvail?has_content> alert</#if>" href="javascript:lookup_popup1('showHelp?helpTopic=${helpTopic}&amp;portalPageId=${parameters.portalPageId!}','help' ,500,500);" title="${uiLabelMap.CommonHelp}">Help</a></li>
            </#if>
            <#if userLogin??>
              <#if (userPreferences.COMPACT_HEADER)?default("N") == "Y">
                <li class="collapsed list-unstyled list-inline-item"><a href="javascript:document.setUserPreferenceCompactHeaderN.submit()">&nbsp;&nbsp;Collapse</a>
                <form name="setUserPreferenceCompactHeaderN" method="post" action="<@ofbizUrl>setUserPreference</@ofbizUrl>">
                    <input type="hidden" name="userPrefGroupTypeId" value="GLOBAL_PREFERENCES"/>
                    <input type="hidden" name="userPrefTypeId" value="COMPACT_HEADER"/>
                    <input type="hidden" name="userPrefValue" value="N"/>
                </form>
                </li>
              <#else>
                <li class="expanded list-unstyled list-inline-item"><a href="javascript:document.setUserPreferenceCompactHeaderY.submit()">&nbsp;&nbsp;Expand</a>
                <form name="setUserPreferenceCompactHeaderY" method="post" action="<@ofbizUrl>setUserPreference</@ofbizUrl>">
                    <input type="hidden" name="userPrefGroupTypeId" value="GLOBAL_PREFERENCES"/>
                    <input type="hidden" name="userPrefTypeId" value="COMPACT_HEADER"/>
                    <input type="hidden" name="userPrefValue" value="Y"/>
                </form>
                </li>
              </#if>
            </#if>
            <li class="control-area list-unstyled list-inline-item">
            </li>
          </ul>
        </li>
      </ul>
      <br class="clear" />
    </div>
