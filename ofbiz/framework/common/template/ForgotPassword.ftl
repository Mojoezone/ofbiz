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

<center class="d-flex justify-content-center mb-4" style="margin-top: 10%;">
  <div class="screenlet login-screenlet bg-dark p-2 text-white rounded pt-4 pr-4 pl-3">
    <div class="screenlet-title-bar mb-3">
      <h3 class="h2">${uiLabelMap.CommonForgotYourPassword}?</h3>
    </div>
    <div class="screenlet-body">
      <form method="post" action="<@ofbizUrl>forgotPassword_step2</@ofbizUrl>" name="getSecurityQuestion">
        <table class="basic-table" cellspacing="0" style="border-collapse:collapse;  border: none;">
          <tr style="background-color: transparent;">
            <td class="label mr-2" style="border-top: none;">${uiLabelMap.CommonUsername}</td>
            <td class="pt-1" style="border-top: none; padding: 0;"><input type="text" size="20" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/></td>
          </tr>
          <tr>
            <td colspan="2" align="center" style="border-top: none;">
              <input type="submit" class="smallSubmit rounded btn mt-2" value="${uiLabelMap.CommonContinue}"/>
            </td>
          </tr>
          <tr style="background-color:transparent;">
            <td colspan="2" align="center" style="border-top: none;">
              <a class="text-muted" href='<@ofbizUrl>authview</@ofbizUrl>' class="buttontext">${uiLabelMap.CommonGoBack}</a>
            </td>
          </tr>
        </table>
        <input type="hidden" name="JavaScriptEnabled" value="N"/>
      </form>
    </div>
  </div>
</center>
