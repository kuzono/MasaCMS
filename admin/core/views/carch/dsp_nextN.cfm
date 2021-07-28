<!--- 
This file is part of Masa CMS. Masa CMS is based on Mura CMS, and adopts the  
same licensing model. It is, therefore, licensed under the Gnu General Public License 
version 2 only, (GPLv2) subject to the same special exception that appears in the licensing 
notice set out below. That exception is also granted by the copyright holders of Masa CMS 
also applies to this file and Masa CMS in general. 

This file has been modified from the original version received from Mura CMS. The 
change was made on: 2021-07-27
Although this file is based on Mura™ CMS, Masa CMS is not associated with the copyright 
holders or developers of Mura™CMS, and the use of the terms Mura™ and Mura™CMS are retained 
only to ensure software compatibility, and compliance with the terms of the GPLv2 and 
the exception set out below. That use is not intended to suggest any commercial relationship 
or endorsement of Mura™CMS by Masa CMS or its developers, copyright holders or sponsors. 

If you want an original copy of Mura™ CMS please go to murasoftware.com .  
For more information about the unaffiliated Masa CMS, please go to masacms.com  

Masa CMS is free software: you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation, Version 2 of the License. 
Masa CMS is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details. 

You should have received a copy of the GNU General Public License 
along with Masa CMS. If not, see <http://www.gnu.org/licenses/>. 

The original complete licensing notice from the Mura CMS version of this file is as 
follows: 

This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
Mura CMS under the license of your choice, provided that you follow these specific guidelines:

Your custom code

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

	/admin/
	/core/
	/Application.cfc
	/index.cfm

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->

<cfset isMore=hasKids gt session.mura.nextN>

<cfif isMore>

<cfset nextN=application.utility.getNextN(hasKids,session.mura.nextN,rc.startRow,2)>
<!--- <cfset TotalRecords=rsNext.RecordCount>
<cfset RecordsPerPage=session.mura.nextN>
<cfset NumberOfPages=Ceiling(TotalRecords/RecordsPerPage)>
<cfset CurrentPageNumber=Ceiling(rc.StartRow/RecordsPerPage)> --->

<cfif application.settingsManager.getSite(rc.siteid).getlocking() neq 'all'>
<cfset numRows=8>
<cfelse>
<cfset numRows=4>
</cfif>

<cfsavecontent variable="pagelist"><cfoutput>
		<cfset args=arrayNew(1)>
		<cfset args[1]="#nextn.startrow#-#nextn.through#">
		<cfset args[2]=nextn.totalrecords>
		<div class="clearfix mura-results-wrapper">
		<p class="search-showing">
			#application.rbFactory.getResourceBundle(session.rb).messageFormat(application.rbFactory.getKeyValue(session.rb,"sitemanager.paginationmeta"),args)#
		</p>
			 <ul class="pagination">
			  <cfif nextN.currentpagenumber gt 1>
			  	<li>
			  	<a href="" onclick="return siteManager.loadSiteManager('#esapiEncode('javascript',rc.siteid)#','#esapiEncode('javascript',rc.topid)#','#esapiEncode('javascript',rc.moduleid)#','','','#esapiEncode('javascript',rc.ptype)#',#nextN.previous#);"><i class="mi-angle-left"></i></a>
			  	</li>
			  </cfif>
			  <cfloop from="#nextN.firstPage#"  to="#nextN.lastPage#" index="i">
			  <cfif nextN.currentpagenumber eq i>
			  		<li class="active"><a href="##">#i#</a></li>
			  <cfelse>
			  		<li>
			  			<a href="" onclick="return siteManager.loadSiteManager('#esapiEncode('javascript',rc.siteid)#','#esapiEncode('javascript',rc.topid)#','#esapiEncode('javascript',rc.moduleid)#','','','#esapiEncode('javascript',rc.ptype)#',#evaluate('(#i#*#nextN.recordsperpage#)-#nextN.recordsperpage#+1')#);">#i#</a>
			  		</li>
			  	</cfif>
		     </cfloop>
			 <cfif nextN.currentpagenumber lt nextN.NumberOfPages>
			 	<li>
			 		<a href="" onclick="return siteManager.loadSiteManager('#esapiEncode('javascript',rc.siteid)#','#esapiEncode('javascript',rc.topid)#','#esapiEncode('javascript',rc.moduleid)#','','','#esapiEncode('javascript',rc.ptype)#',#nextN.next#);"><i class="mi-angle-right"></i></a> 
			 	</li>
			 </cfif>
			</ul>
		</div>
</cfoutput>
</cfsavecontent>

</cfif>
