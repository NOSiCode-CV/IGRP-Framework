<%@page isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IGRPWEB - Error Page</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
  <style>
    body { background-color: #f5f5f5; }
    a { color: #5bc0de}
    code {
	  color: crimson;
	  background-color: #f1f1f1;
	  padding: 2px;
	  font-family: monospace;
	}
  </style>

</head>

<body>

	<%
		String isPublic = request.getParameter("isPublic");
		isPublic = isPublic == null ? "0" : isPublic;
		String target = request.getParameter("target");
		target = target == null ? "self" : target;
		Integer errorCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
		errorCode = errorCode == null ? 500 : errorCode;
		
		Map<String, Object> igrpErrorParam = new HashMap<String, Object>();
		Map<String, Object> igrpErrorParamCopy = (Map<String, Object>) request.getAttribute("igrp.error");
		if(igrpErrorParamCopy != null)
			igrpErrorParam.putAll(igrpErrorParamCopy);
	%>

  <div class="container py-5">
  
    <article class="d-flex flex-column align-items-center">
      <div>
        <img class="img-fluid w-100" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjxzdmcKICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICB4bWxuczpjYz0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbnMjIgogICB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiCiAgIHhtbG5zOnN2Zz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCiAgIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIKICAgeG1sbnM6c29kaXBvZGk9Imh0dHA6Ly9zb2RpcG9kaS5zb3VyY2Vmb3JnZS5uZXQvRFREL3NvZGlwb2RpLTAuZHRkIgogICB4bWxuczppbmtzY2FwZT0iaHR0cDovL3d3dy5pbmtzY2FwZS5vcmcvbmFtZXNwYWNlcy9pbmtzY2FwZSIKICAgaWQ9IkxheWVyXzEiCiAgIGRhdGEtbmFtZT0iTGF5ZXIgMSIKICAgdmlld0JveD0iMCAwIDMwMi44NTUwNCAyMjguNDcwOTEiCiAgIHZlcnNpb249IjEuMSIKICAgc29kaXBvZGk6ZG9jbmFtZT0ibG9nb0lHUlBXRUIgc28gbG9nb192NC4wLnN2ZyIKICAgaW5rc2NhcGU6dmVyc2lvbj0iMC45Mi4xIHIxNTM3MSIKICAgd2lkdGg9IjguMDEzMDM5NmNtIgogICBoZWlnaHQ9IjYuMDQ0OTZjbSI+CiAgPG1ldGFkYXRhCiAgICAgaWQ9Im1ldGFkYXRhMzMiPgogICAgPHJkZjpSREY+CiAgICAgIDxjYzpXb3JrCiAgICAgICAgIHJkZjphYm91dD0iIj4KICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3N2Zyt4bWw8L2RjOmZvcm1hdD4KICAgICAgICA8ZGM6dHlwZQogICAgICAgICAgIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiIC8+CiAgICAgICAgPGRjOnRpdGxlPmxvZ29JR1JQV0VCX3Y0LjA8L2RjOnRpdGxlPgogICAgICA8L2NjOldvcms+CiAgICA8L3JkZjpSREY+CiAgPC9tZXRhZGF0YT4KICA8c29kaXBvZGk6bmFtZWR2aWV3CiAgICAgcGFnZWNvbG9yPSIjZmZmZmZmIgogICAgIGJvcmRlcmNvbG9yPSIjNjY2NjY2IgogICAgIGJvcmRlcm9wYWNpdHk9IjEiCiAgICAgb2JqZWN0dG9sZXJhbmNlPSIxMCIKICAgICBncmlkdG9sZXJhbmNlPSIxMCIKICAgICBndWlkZXRvbGVyYW5jZT0iMTAiCiAgICAgaW5rc2NhcGU6cGFnZW9wYWNpdHk9IjAiCiAgICAgaW5rc2NhcGU6cGFnZXNoYWRvdz0iMiIKICAgICBpbmtzY2FwZTp3aW5kb3ctd2lkdGg9IjE1MTQiCiAgICAgaW5rc2NhcGU6d2luZG93LWhlaWdodD0iODUxIgogICAgIGlkPSJuYW1lZHZpZXczMSIKICAgICBzaG93Z3JpZD0iZmFsc2UiCiAgICAgaW5rc2NhcGU6em9vbT0iMS4wMzk1MjY2IgogICAgIGlua3NjYXBlOmN4PSItNjcuNzMyMjAxIgogICAgIGlua3NjYXBlOmN5PSI3My44NDI4MDciCiAgICAgaW5rc2NhcGU6d2luZG93LXg9IjAiCiAgICAgaW5rc2NhcGU6d2luZG93LXk9IjAiCiAgICAgaW5rc2NhcGU6d2luZG93LW1heGltaXplZD0iMCIKICAgICBpbmtzY2FwZTpjdXJyZW50LWxheWVyPSJMYXllcl8xIgogICAgIGZpdC1tYXJnaW4tdG9wPSIwIgogICAgIGZpdC1tYXJnaW4tbGVmdD0iMCIKICAgICBmaXQtbWFyZ2luLXJpZ2h0PSIwIgogICAgIGZpdC1tYXJnaW4tYm90dG9tPSIwIgogICAgIHVuaXRzPSJjbSIgLz4KICA8ZGVmcwogICAgIGlkPSJkZWZzNCI+CiAgICA8c3R5bGUKICAgICAgIGlkPSJzdHlsZTIiPi5jbHMtMXtmaWxsOiNjNGNjZDQ7fS5jbHMtMSwuY2xzLTJ7b3BhY2l0eTowLjg7fS5jbHMtMntmaWxsOiMzYWEwZDk7fS5jbHMtM3tmaWxsOiMyMzFmMjA7fTwvc3R5bGU+CiAgPC9kZWZzPgogIDx0aXRsZQogICAgIGlkPSJ0aXRsZTYiPmxvZ29JR1JQV0VCX3Y0LjA8L3RpdGxlPgogIDxwYXRoCiAgICAgY2xhc3M9ImNscy0xIgogICAgIGQ9Im0gMTYuNDIzNDEzLDc3LjEwODc1IGggNjUuOTA5OTk5IGEgNi44Miw2LjgyIDAgMCAxIDUuNTEsMi44MSBsIDUzLjk5OTk5OCw3NC40Nzk5OCBIIDU5LjEzMzQxMyBsIC00OC4yMiwtNjYuNDk5OTggYSA2LjgsNi44IDAgMCAxIDUuNTEsLTEwLjc5IHoiCiAgICAgaWQ9InBhdGg4IgogICAgIGlua3NjYXBlOmNvbm5lY3Rvci1jdXJ2YXR1cmU9IjAiCiAgICAgc3R5bGU9Im9wYWNpdHk6MC44O2ZpbGw6I2M0Y2NkNCIgLz4KICA8cGF0aAogICAgIGNsYXNzPSJjbHMtMiIKICAgICBkPSJtIDE4NC41NTM0MSw3Ny4xMDg3NSBoIC02NS45IGEgNi44Miw2LjgyIDAgMCAwIC01LjUxLDIuODEgbCAtNTMuOTk5OTk3LDc0LjQ3OTk4IGggODIuNzA5OTk3IGwgNDguMjIsLTY2LjQ5OTk4IGEgNi44LDYuOCAwIDAgMCAtNS41MiwtMTAuNzkgeiIKICAgICBpZD0icGF0aDEwIgogICAgIGlua3NjYXBlOmNvbm5lY3Rvci1jdXJ2YXR1cmU9IjAiCiAgICAgc3R5bGU9Im9wYWNpdHk6MC44O2ZpbGw6IzNhYTBkOSIgLz4KICA8cGF0aAogICAgIGNsYXNzPSJjbHMtMSIKICAgICBkPSJtIDExOC42NTM0MSw3Ny4xMDg3NSBoIDY1LjkgYSA2LjgyLDYuODIgMCAwIDEgNS41MSwyLjgxIGwgNTQsNzQuNDc5OTggaCAtODIuNzEgbCAtNDguMjIsLTY2LjQ5OTk4IGEgNi44LDYuOCAwIDAgMSA1LjUyLC0xMC43OSB6IgogICAgIGlkPSJwYXRoMTIiCiAgICAgaW5rc2NhcGU6Y29ubmVjdG9yLWN1cnZhdHVyZT0iMCIKICAgICBzdHlsZT0ib3BhY2l0eTowLjg7ZmlsbDojYzRjY2Q0IiAvPgogIDxwYXRoCiAgICAgY2xhc3M9ImNscy0yIgogICAgIGQ9Im0gMjg2Ljc3MzQxLDc3LjEwODc1IGggLTY1LjkxIGEgNi44Miw2LjgyIDAgMCAwIC01LjUxLDIuODEgbCAtNTQsNzQuNDc5OTggaCA4Mi43MSBsIDQ4LjIyLC02Ni40OTk5OCBhIDYuOCw2LjggMCAwIDAgLTUuNTEsLTEwLjc5IHoiCiAgICAgaWQ9InBhdGgxNCIKICAgICBpbmtzY2FwZTpjb25uZWN0b3ItY3VydmF0dXJlPSIwIgogICAgIHN0eWxlPSJvcGFjaXR5OjAuODtmaWxsOiMzYWEwZDkiIC8+Cjwvc3ZnPgo=">
      </div>
      <% if(errorCode.intValue() == 500){ %>
      	<h1 class="text-center">500 | Internal Server Error</h1>
      <% } %>
      <% if(errorCode.intValue() == 404){ %>
      	<h1 class="text-center">404 | Oops! Página não encontrada.</h1>
      <% } %>
      <div class="d-flex flex-column align-items-center mt-4">
      	<% if(errorCode.intValue() == 500){ %>
        	<p class="text-center">Ocorreu um erro inesperado. Por favor contactar o serviço de HELPDESK para mais informações.</p>
        <% } %>
        <% if(errorCode.intValue() == 404){ %>
        	<p class="text-center">A página que você está procurando não foi encontrada.</p>
        <% } %>
        <p class="contacts">
          Email: <a href="mailto:#">helpdesk@nosi.cv</a> 
          ou Telefone: <a href="tel:#">2607973</a>
        </p> 
      </div>
      <%
      		String href = String.format("%s?%s", request.getRequestURI().replace("/error.jsp", "/app/webapps"), "r=igrp/home/index");
      %>
       <div class="btn-toolbar">
    	   <a href="javascript:history.back()" class="btn btn-secondary px-3 mt-4 mr-2" role="button" aria-pressed="true">◁ Back</a>
      <% if(!isPublic.equals("1") && target.equals("self")){  %>
	     
	      
	      	<a href="<%= href %>" class="btn btn-primary px-3 mt-4 mr-2" role="button" aria-pressed="true">IGRP Home</a>
	      	<% if(errorCode.intValue() == 500){
	      		String dad = (String) igrpErrorParam.get("dad");
	      		if(dad != null && !dad.trim().isEmpty())
	      			href = String.format("%s&dad=%s", href, dad);
	      	%>
      			<a href="<%= href %>" class="btn btn-secondary px-3 mt-4 mr-2" role="button" aria-pressed="true">APP Home</a>
	      	<% } %>
	     
     <% } %>
      </div>
    </article>
    
    <% 
    	String env = (String) igrpErrorParam.getOrDefault("igrp.env", "dev");
    	if(errorCode.intValue() == 500 && !env.equalsIgnoreCase("prod")){
    %>
    
		    <div class="d-flex justify-content-center mt-4">
		      <div class="accordion mt-4 shadow flex-fill" id="accordionErrorPage" style="width: 100%;">
		      
		        <div class="card">
		          <div class="card-header btn text-muted mb-0 px-4 border-bottom-0" 
		            id="headingOne" 
		            type="button"
		            data-toggle="collapse"
		            data-target="#collapseOne"
		            aria-expanded="false"
		            aria-controls="collapseOne"
		          > 
		            Detalhes do Erro
		          </div>
		      
		          <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionErrorPage">          
		            <div class="card-body">
		            	<code>
		            	<pre class="prettyprint lang-java linenums">		            	
		            	<%  
		            		PrintWriter pw = new PrintWriter(out);
		            		exception.printStackTrace(pw);
		            		if(exception.getCause() != null){
		            			exception.getCause().printStackTrace(pw);
		            		}
		            	%>		            	
		            	</pre>
		            	</code>
		            </div>
		          </div>
		        </div>
		               
		      </div>
		    </div>
		    
	    <% } %>
    
    
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  
</body>

</html>