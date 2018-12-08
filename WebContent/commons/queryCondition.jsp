<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function passwordset(){
	$(location).attr("href","info.do?type=1");
}
function infoset(){
	$(location).attr("href","info.do?type=0");
}
function showorder(){
	$(location).attr("href","info.do?type=2");
}
</script>
<script type="text/javascript">
	
	 $(function(){
		 
		 /*$("a").each(function(){
			this.onclick = function(){
				
				 var serializeVal = $(":hidden").serialize();
				var href = this.href + "&" + serializeVal;
				window.location.href = href;			
				return false; 
			};
		});*/
	});	 
	
</script>

