package nosi.core.webapp;
/**
 * Marcel Iekiny
 * Sep 25, 2017
 */
public enum HttpStatus {
	
	STATUS_100(100, "Continue"),
	STATUS_101(101, "Switching Protocols"),
	STATUS_102(102, "Processing"),
	STATUS_118(118, "Connection timed out"),
	
	STATUS_200(200, "Ok"),
	STATUS_201(201, "Created"),
	STATUS_202(202, "Accepted"),
	STATUS_203(203, "Non-Authoritative"),
	STATUS_204(204, "No Content"),
	STATUS_205(205, "Reset Content"),
	STATUS_206(206, "Partial Content"),
	STATUS_207(207, "Multi-Status"),
	STATUS_208(208, "Already Reported"),
	STATUS_210(210, "Content Different"),
	STATUS_226(226, "IM Used"),
	
	STATUS_300(300, "Multiple Choices"),
	STATUS_301(301, "Moved Permanently"),
	STATUS_302(302, "Found"),
	STATUS_303(303, "See Other"),
	STATUS_304(304, "Not Modified"),
	STATUS_305(305, "Use Proxy"),
	STATUS_306(306, "Reserved"),
	STATUS_307(307, "Temporary Redirect"),
	STATUS_308(308, "Permanent Redirect"),
	STATUS_310(310, "Too many Redirect"),
	
	STATUS_400(400, "Bad Request"),
	STATUS_401(401, "Unauthorized"),
	STATUS_402(402, "Payment Required"),
	STATUS_403(403, "Forbidden"),
	STATUS_404(404, "Not Found"),
	STATUS_405(405, "Method Not Allowed"),
	STATUS_406(406, "Not Acceptable"),
	STATUS_407(407, "Proxy Authentication Required"),
	STATUS_408(408, "Request Time-out"),
	STATUS_409(409, "Conflict"),
	STATUS_410(410, "Gone"),
	STATUS_411(411, "Length Required"),
	STATUS_412(412, "Precondition Failed"),
	STATUS_413(413, "Request Entity Too Large"),
	STATUS_414(414, "Request-URI Too Long"),
	STATUS_415(415, "Unsupported Media Type"),
	STATUS_416(416, "Requested range unsatisfiable"),
	STATUS_417(417, "Expectation failed"),
	STATUS_418(418, "I\'m a teapot"),
	STATUS_421(421, "Misdirected Request"),
	
	STATUS_500(500, "Internal Server Error"),
	STATUS_501(501, "Not Implemented"),
	STATUS_502(310, "Bad Gateway or Proxy Error"),
	STATUS_503(503, "Service Unavailable"),
	STATUS_504(504, "Gateway Time-out"),
	STATUS_505(505, "HTTP Version not supported"),
	STATUS_507(507, "Insufficient storage"),
	STATUS_508(508, "Loop Detected"),
	STATUS_509(509, "Bandwidth Limit Exceeded"),
	STATUS_510(510, "Not Extended"),
	STATUS_511(511, "Network Authentication Required");
	
	 HttpStatus(int statusCode, String statusText) {
		 this.statusCode = statusCode;
		 this.statusText = statusText;
	 };
	 
		/* 
			422 => 'Unprocessable entity', 
			423 => 'Locked', 
			424 => 'Method failure',
			425 => 'Unordered Collection',
			426 => 'Upgrade Required', 
			428 => 'Precondition Required',
			429 => 'Too Many Requests', 
			431 => 'Request Header Fields Too Large', 
			449 => 'Retry With', 
			450 => 'Blocked by Windows Parental Controls',
			451 => 'Unavailable For Legal Reasons',
			 
			*/
	 
	 	private int statusCode;
		private String statusText;
		
		public int getStatusCode() {
			return statusCode;
		}
		public void setStatusCode(int statusCode) {
			this.statusCode = statusCode;
		}
		public String getStatusText() {
			return statusText;
		}
		public void setStatusText(String statusText) {
			this.statusText = statusText;
		}
		
	}
