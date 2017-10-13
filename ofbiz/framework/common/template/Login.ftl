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

<#if requestAttributes.uiLabelMap??><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>
<#assign useMultitenant = Static["org.apache.ofbiz.base.util.UtilProperties"].getPropertyValue("general.properties", "multitenant")>

<#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>
<#if username != "">
  <#assign focusName = false>
<#else>
  <#assign focusName = true>
</#if>

<center class="d-flex justify-content-center">
  <div class="screenlet login-screenlet bg-dark p-2 text-white rounded pt-4 pr-4 pl-3">
    <div class="screenlet-title-bar mb-3">
      <h3 class="h2">${uiLabelMap.CommonRegistered}</h3>
    </div>
    <div class="screenlet-body">
      <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform">
        <table class="basic-table" cellspacing="0" style="border-collapse:collapse; border: none;">
          <tr>
            <td class="label mr-2 mb-1"  style="border-top: none;">${uiLabelMap.CommonUsername}</td>
            <td class="pt-1" style="border-top: none; padding: 0;"><input type="text" name="USERNAME" value="${username}" size="20"/></td>
          </tr>
          <tr style="background-color: transparent;">
            <td class="label mr-2" style="border-top: none;">${uiLabelMap.CommonPassword}</td>
            <td  class="pt-1" style="border-top: none; padding: 0;"><input class="form-control" type="password" name="PASSWORD" value="" size="20" /></td>
          </tr>
          <#if ("Y" == useMultitenant) >
            <#if !requestAttributes.userTenantId??>
              <tr>
                <td class="label btn btn-secondary" style="border-top: none; padding: 0;">${uiLabelMap.CommonTenantId}</td>
                <td><input type="text" name="userTenantId" value="${parameters.userTenantId!}" size="20"/></td>
              </tr>
            <#else>
                <input type="hidden" name="userTenantId" value="${requestAttributes.userTenantId!}"/>
            </#if>
          </#if>
          <tr>
            <td colspan="2" align="center" style="border-top: none; padding: 0;">
              <input class="rounded btn mt-2" type="submit" value="${uiLabelMap.CommonLogin}"/>
            </td>
          </tr>
        </table>
        <input type="hidden" name="JavaScriptEnabled" value="N"/>
        <br />
        <a class="text-muted" href="<@ofbizUrl>forgotPassword_step1</@ofbizUrl>">${uiLabelMap.CommonForgotYourPassword}?</a>
      </form>
    </div>
  </div>
</center>

<script language="JavaScript" type="text/javascript">
  document.loginform.JavaScriptEnabled.value = "Y";
  <#if focusName>
    document.loginform.USERNAME.focus();
  <#else>
    document.loginform.PASSWORD.focus();
  </#if>
</script>