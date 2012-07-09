<cfoutput>
	
	<!--- 
		Converts CFWheels API XML to Sublime Syntax, Just replace the old with the new in the following files:
		CFScript.sublime-completions - Line 357
		Cfscript.tmLanguage - Line 939
	--->
	
	<cfhttp url="http://cfwheels.org/docs/1-1/function.xml" method="get">
		<cfhttpparam type="header" name="accept-encoding" value="deflate;q=0">
		<cfhttpparam type="header" name="te" value="deflate;q=0">
	</cfhttp>
	
	<cfset objRSS = xmlParse(Trim(cfhttp.filecontent))> 
	<cfset Item_Length = arraylen(objRSS.functions.function)>
	
	<cfloop from="1" to="#Item_Length#" index="i">	
		
		<cfif StructKeyExists(objRSS.functions.function[i],"arguments") AND StructKeyExists(objRSS.functions.function[i].arguments,"argument")>			
			{ "trigger": "#objRSS.functions.function[i].XmlAttributes.name#\tFunction (cfscript)", "contents": "#objRSS.functions.function[i].XmlAttributes.name#(${1: 				
			<cfif StructKeyExists(objRSS.functions.function[i],"arguments") AND 
				  StructKeyExists(objRSS.functions.function[i].arguments,"argument") AND
				  StructKeyExists(objRSS.functions.function[i].arguments.argument[1],"XmlAttributes") AND 
				  StructKeyExists(objRSS.functions.function[i].arguments.argument[1].XmlAttributes,"name")>				
				<cfset Item_Length2 = arraylen(objRSS.functions.function[i].arguments.argument)>				
				<cfset count = 2>				
				<cfloop from="1" to="#Item_Length2#" index="j">
				<cfif StructKeyExists(objRSS.functions.function[i],"arguments") AND 
						  StructKeyExists(objRSS.functions.function[i].arguments,"argument") AND
				  		  StructKeyExists(objRSS.functions.function[i].arguments.argument[j],"XmlAttributes") AND 
				  		  StructKeyExists(objRSS.functions.function[i].arguments.argument[j].XmlAttributes,"name")>
						  ${#count#:#objRSS.functions.function[i].arguments.argument[j].XmlAttributes.name#(#objRSS.functions.function[i].arguments.argument[j].type.xmltext#)}<cfif j neq Item_Length2>,</cfif>
						  					  
						  <cfset count++>
					</cfif>				
				</cfloop>			
			</cfif>

			})"},<br />
			
		</cfif>
	</cfloop><br /><br /><br /><br />
	<cfset count = 1>
	<cfloop from="1" to="#Item_Length#" index="i"><cfif StructKeyExists(objRSS.functions.function[i],"arguments") AND StructKeyExists(objRSS.functions.function[i].arguments,"argument")>|#trim(objRSS.functions.function[i].XmlAttributes.name)#<cfif count eq 7><br /><cfset count = 1><Cfelse><cfset count++></cfif></cfif></cfloop>

</cfoutput>