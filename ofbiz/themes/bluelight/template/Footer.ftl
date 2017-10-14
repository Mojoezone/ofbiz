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
<#if userLogin?has_content>
<div id="footer" class="clearfix bg-dark footer container-fluid mt-5 pt-4 pb-2">

    <ul class="row text-center">
        <li class="first list-unstyled col-12">${nowTimestamp?datetime?string.short} - <a href="<@ofbizUrl>ListTimezones</@ofbizUrl>">${timeZone.getDisplayName(timeZone.useDaylightTime(), Static["java.util.TimeZone"].LONG, locale)}</a></li>
        <li class=" list-unstyled col-12"><a href="<@ofbizUrl>ListLocales</@ofbizUrl>">${locale.getDisplayName(locale)}</a></li>
        <li class="last list-unstyled col-12"><a href="<@ofbizUrl>ListVisualThemes</@ofbizUrl>">${uiLabelMap.CommonVisualThemes}</a></li>
    </ul>
  
    <div>
    <p class="row text-center">
    <span class="footerTextColour col-12 small">${uiLabelMap.CommonPoweredBy} 
        <a  class="small" href="http://ofbiz.apache.org" class="noicon">OFBiz </a>
    </span>
    <span class="footerTextColour col-12 small">Copyright 2001-${nowTimestamp?string("yyyy")} 
        <a class="small" href="http://www.apache.org" class="noicon">The Apache Software Foundation - www.apache.org</a></span> 
        <span class="footerTextColour col-12">
            <#include "ofbizhome://runtime/SvnInfo.ftl" ignore_missing=true/>
            <#include "ofbizhome://runtime/GitInfo.ftl" ignore_missing=true/>
        </span>
        </p>
    </div>
  
  
</div>
</div>
<#if layoutSettings.VT_FTR_JAVASCRIPT?has_content>
  <#list layoutSettings.VT_FTR_JAVASCRIPT as javaScript>
    <script type="text/javascript" src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>" type="text/javascript"></script>
  </#list>
</#if>
</#if>
<script>

jQuery("table").addClass("table table-responsive table-striped");
jQuery("table thead").addClass("table-inverse small");
jQuery("table th").addClass("table-inverse");
jQuery(".smallSubmit").addClass("btn btn-success");
jQuery("input[type='submit']").addClass("btn btn-primary");
jQuery(".nav-pager ul").addClass("pagination");
jQuery(".nav-pager ul li").addClass("page-link");
jQuery(".button-bar.tab-bar ul li ul").addClass("nav btn-group");
jQuery(".button-bar.tab-bar ul li ul li").addClass("nav-item  btn btn-outline-secondary  btn-sm");
jQuery(".button-bar.tab-bar ul li ul li a").addClass("nav-link");
jQuery("#column-container").addClass("clearfix");
jQuery("div.button-bar.button-style-2").addClass("mb-4 container-fluid");
jQuery("div.button-bar.button-style-2 a").addClass("text-primary btn btn-outline-info");
jQuery("#uploadPartyContent>*").addClass("mb-1 mt-1");
jQuery("input[type='text']").addClass("form-control");
jQuery("select").addClass("custom-select");
</script>

</body>
</html>
