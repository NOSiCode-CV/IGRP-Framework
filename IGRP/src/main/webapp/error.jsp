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
  <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
  <style>
    body { background-color: #f5f5f5; }
    a { color: #5bc0de }
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
		Integer errorCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
		errorCode = errorCode == null ? 500 : errorCode;

		Map<String, Object> igrpErrorParam = new HashMap<String, Object>();
		Map<String, Object> igrpErrorParamCopy = (Map<String, Object>) request.getAttribute("igrp.error");
		if(igrpErrorParamCopy != null)
			igrpErrorParam.putAll(igrpErrorParamCopy);
	%>

  <div class="container py-5">

    <article class="d-flex flex-column align-items-center">
      <div>
              <img class="img-fluid w-100" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjxzdmcKICAgaWQ9IkxheWVyXzEiCiAgIHZpZXdCb3g9IjAgMCAyMzEuODcwOTYgMTQ0LjgzMzI0IgogICB2ZXJzaW9uPSIxLjEiCiAgIHNvZGlwb2RpOmRvY25hbWU9ImxvZ28zLnN2ZyIKICAgd2lkdGg9IjE4NS40OTY3NyIKICAgaGVpZ2h0PSIxMTUuODY2NTkiCiAgIGlua3NjYXBlOnZlcnNpb249IjEuMi4xICg5YzZkNDFlNCwgMjAyMi0wNy0xNCkiCiAgIHhtbG5zOmlua3NjYXBlPSJodHRwOi8vd3d3Lmlua3NjYXBlLm9yZy9uYW1lc3BhY2VzL2lua3NjYXBlIgogICB4bWxuczpzb2RpcG9kaT0iaHR0cDovL3NvZGlwb2RpLnNvdXJjZWZvcmdlLm5ldC9EVEQvc29kaXBvZGktMC5kdGQiCiAgIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIKICAgeG1sbnM6c3ZnPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPHNvZGlwb2RpOm5hbWVkdmlldwogICAgIGlkPSJuYW1lZHZpZXc2OSIKICAgICBwYWdlY29sb3I9IiM1MDUwNTAiCiAgICAgYm9yZGVyY29sb3I9IiNlZWVlZWUiCiAgICAgYm9yZGVyb3BhY2l0eT0iMSIKICAgICBpbmtzY2FwZTpzaG93cGFnZXNoYWRvdz0iMCIKICAgICBpbmtzY2FwZTpwYWdlb3BhY2l0eT0iMCIKICAgICBpbmtzY2FwZTpwYWdlY2hlY2tlcmJvYXJkPSIwIgogICAgIGlua3NjYXBlOmRlc2tjb2xvcj0iIzUwNTA1MCIKICAgICBzaG93Z3JpZD0iZmFsc2UiCiAgICAgaW5rc2NhcGU6em9vbT0iMS4yMjkxNjY3IgogICAgIGlua3NjYXBlOmN4PSI1NC41MDg0NzMiCiAgICAgaW5rc2NhcGU6Y3k9IjkxLjExODY0MiIKICAgICBpbmtzY2FwZTp3aW5kb3ctd2lkdGg9IjE1MjkiCiAgICAgaW5rc2NhcGU6d2luZG93LWhlaWdodD0iNDU2IgogICAgIGlua3NjYXBlOndpbmRvdy14PSIyMjQiCiAgICAgaW5rc2NhcGU6d2luZG93LXk9IjI1IgogICAgIGlua3NjYXBlOndpbmRvdy1tYXhpbWl6ZWQ9IjAiCiAgICAgaW5rc2NhcGU6Y3VycmVudC1sYXllcj0iTGF5ZXJfMSIgLz4KICA8ZGVmcwogICAgIGlkPSJkZWZzNCI+CiAgICA8c3R5bGUKICAgICAgIGlkPSJzdHlsZTIiPi5jbHMtMXtmaWxsOiMwMDlmZGU7fS5jbHMtMntmaWxsOiNjMGNiZDY7fS5jbHMtM3tmaWxsOiMyNDIwMjA7fS5jbHMtNHtmaWxsOiM0MWE2ZGM7fTwvc3R5bGU+CiAgPC9kZWZzPgogIDxnCiAgICAgaWQ9ImcyOCIKICAgICB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjAuNDg0Nzg0LDkuMzIwMTcxMykiPgogICAgPHBhdGgKICAgICAgIGNsYXNzPSJjbHMtMiIKICAgICAgIGQ9Im0gMjY4LjA4LDc2LjE4IGMgLTEuOTMsLTguNDcgLTE0Ljg1LC0xOC41MyAtOTQuODksLTQuNjQgMCwtMTIuOTIgMC4xNSwtMjEuNzQgMCwtNDMuNzMgLTAuMTEsLTE1LjUxIC04LC0yNi42MiAtMjEuNjcsLTIwLjY5IC0yNi45OCwxMS43IC01Mi4wNyw0NC4yIC02Ni43Myw3Mi4yNyAtNC41Nyw4Ljc0IC0xLjQyLDI0LjUgMTEuODQsMjMuNjMgMjIuNzgsLTEuNSAzOS43MywtOS4zNSA2MS44OCwtMTQuMDEgMS4zNiwxMi44MiAxMS45OSwzMi43MSAyOS43MiwzMi4zNSA0Mi4xNiwtMC44NyA4Mi42NiwtMzIuODEgNzkuODQsLTQ1LjE3IHogbSAtMTExLjcsLTEuMzYgYyAtOS44MiwxLjMyIC0zNC4zNCw2LjY5IC01NS43LDEyLjcgLTAuODUsMC4yNCAtMS42NCwtMC41MyAtMS40MywtMS4zOCAyLjczLC0xMS4xNSAxNC4yLC0yNC44OCAyMC4yMSwtMzIuMSA3LjkxLC05LjQ5IDI0LjA5LC0yNyAzNi45MSwtMzIuODMgLTAuNzgsMTIuNjMgLTAuOTcsMzkuNjMgMCw1My42MiB6IG0gOTEuMTEsNy41OCBjIC04LjM1LDcuOTYgLTM4LjY4LDIyLjgxIC01NC41OSwyNC4wOSAtMTAuOTMsMC44OCAtMTkuOTUsLTEwLjQ0IC0xOS41NiwtMjAuMzUgMTIuNzEsLTUuNDEgNTYuMTgsLTYuNDggNzMuNDcsLTYuNDYgMy4wMiwwIDEuMywyLjEyIDAuNjgsMi43MiB6IgogICAgICAgaWQ9InBhdGgxNiIgLz4KICAgIDxwYXRoCiAgICAgICBjbGFzcz0iY2xzLTQiCiAgICAgICBkPSJtIDE1MC4xOCwxOC4xIGMgLTQwLjYsMTcuNDggLTUzLjAzLDM5LjQ0IC02NS4zNyw2MS4yMiAtNC44Niw4LjU4IC0xLjQyLDI0LjUgMTEuODQsMjMuNjMgMjIuNzgsLTEuNSAzOS43MywtOS4zNSA2MS44OCwtMTQuMDEgbCAtMi4xNCwtMTQuMTggYyAtOS44MiwxLjMyIC0zNC4zNCw2LjY5IC01NS43LDEyLjcgLTAuODUsMC4yNCAtMS42NCwtMC41MyAtMS40MywtMS4zOCAyLjczLC0xMS4xNSAxNC4yLC0yNC44OCAyMC4yMSwtMzIuMSA3LjkxLC05LjQ5IDI0LjA5LC0yNyAzNi45MSwtMzIuODMgMCwwIC0wLjQ0LC01LjUzIC02LjIyLC0zLjA0IHoiCiAgICAgICBpZD0icGF0aDE4IiAvPgogICAgPHBhdGgKICAgICAgIGNsYXNzPSJjbHMtNCIKICAgICAgIGQ9Im0gMjQ1LjgxLDY1LjA2IGMgLTEuMzcsLTAuMTEgLTIuODQsLTAuMTkgLTQuMzgsLTAuMjUgLTAuMTQsMCAtMC4yOCwtMC4wMSAtMC40MiwtMC4wMiAtMC4zOCwtMC4wMSAtMC43NiwtMC4wMyAtMS4xNSwtMC4wNCAtMC44OSwtMC4wMyAtMS44MiwtMC4wNCAtMi43NywtMC4wNSAtMC4xNCwwIC0wLjI4LDAgLTAuNDIsMCAtMC43MSwwIC0xLjQ1LDAgLTIuMTksMC4wMSAtMC4zMiwwIC0wLjYyLDAgLTAuOTQsMCAwLDAgMCwwIC0wLjAxLDAgLTIsMC4wNCAtNC4xMSwwLjExIC02LjM0LDAuMjEgLTEzLjI4LDAuNjMgLTMwLjgyLDIuNjQgLTUzLjk4LDYuNjYgbCAwLjE1LDE0LjYgYyA5LjUsLTQuMDUgMzYuMDEsLTUuNyA1Ni4wMSwtNi4yNiAwLDAuMDEgMCwwLjAyIDAuMDIsMC4wMyA2LjkxLC0wLjE5IDEzLjA2LC0wLjI2IDE3LjQ5LC0wLjI2IDMuMDIsMCAxLjMsMi4xMiAwLjY4LDIuNzIgLTAuNTEsMC40OSAtMS4xMSwxLjAxIC0xLjc4LDEuNTQgMy4wNSwtMi4wNSA1LjA2LC01LjUzIDUuMDYsLTkuNDggMCwtMy45NSAtMS45OCwtNy4zOCAtNC45OSwtOS40NCB6IgogICAgICAgaWQ9InBhdGgyMCIgLz4KICAgIDxnCiAgICAgICBpZD0iZzI2Ij4KICAgICAgPHBhdGgKICAgICAgICAgY2xhc3M9ImNscy0xIgogICAgICAgICBkPSJtIDI0Ni44MSw3OS42OCBjIC0wLjU2LC0yLjI2IC0xNS4wNCwtOC4yMyAtMzUuOTYsLTcuMDYgLTE0Ljk4LDAuODQgLTI2Ljk3LDEuNTQgLTM3LjYzLDIuNDEgbCAwLjEsMTAuODUgYyAxNS44LC0zLjM2IDM2LjY5LC02LjMyIDczLjQ4LC02LjIgeiIKICAgICAgICAgaWQ9InBhdGgyMiIgLz4KICAgICAgPHBhdGgKICAgICAgICAgY2xhc3M9ImNscy0xIgogICAgICAgICBkPSJtIDEwMC41Miw4Ny41IGMgLTIuOTMsNC40OCAyMC45Niw4LjA1IDMzLjcyLDYuNTUgOS4wNCwtMS4wNiAxNi40NCwtMi44MSAyNC4zMiwtNC43MyBsIC0xLjkxLC0xMi42NyBjIC0xNy4wOSwyLjAyIC0zMi43OSw1LjA4IC01Ni4xMywxMC44NSB6IgogICAgICAgICBpZD0icGF0aDI0IiAvPgogICAgPC9nPgogIDwvZz4KPC9zdmc+Cg==">
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
		            		if(exception!=null){
		            			exception.printStackTrace(pw);
			            		if(exception.getCause() != null){
			            			exception.getCause().printStackTrace(pw);
			            		}
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