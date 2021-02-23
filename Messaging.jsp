<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="CSS/Messaging.css" rel="stylesheet">
<link href="CSS/Shop.css" rel="stylesheet">


<title>
	<%
		//Fetch all details here
	String operator = String.valueOf(session.getAttribute("operatingUserName"));//sender
	String userProfileImg = "\"https://bootdey.com/img/Content/avatar/avatar7.png\"";//sender profile
	String clientProfileImg = "\"https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg\"";//receiver profile
	String nameString = String.valueOf(request.getParameter("client"));//receiver
	String msgCount = "1072";
	//String senderNumber="9876543210";
	//String receiverNumber="7896543012";
	String receiverNumber=request.getParameter("receiverNumber");
	String senderNumber=request.getParameter("senderNumber");
	
	out.println(nameString);
	%>
</title>
</head>
<body onload="load()">

	<div class="container">
		<div class="card">
			<div class="card-header msg_head">
			
				<div class="d-flex bd-highlight">
				<%HttpSession ses = request.getSession();
				String type=String.valueOf(ses.getAttribute("type"));
				//out.println(type);
				String link=type.equals("consumer")?("ConsumerDashboard.jsp"):("FarmerDashboard.jsp");
				%>
				<div style="float:left;transform:translate(-50%,25%)">
				<a  href="<%=link%>"><i style="font-size:30px;color:white" class="fa fa-arrow-left"></i></a>
				</div>
				
					<div class="img_cont">
						<img src=<%=clientProfileImg%> onclick="showImg(this)"
							class="rounded-circle user_img"> <span class="online_icon"></span>
					</div>
					<div class="user_info">
						<span><%=nameString%></span>
						<p><%=receiverNumber %>
						</p>
					</div>
					<div class="video_cam">
						<span><i class="fas fa-video"></i></span> <span><i
							class="fas fa-phone"></i></span>
					</div>
				</div>
				<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
				<div class="action_menu">
					<ul>
						<li><i class="fas fa-user-circle"></i> View profile</li>
						<li><i class="fas fa-users"></i> Add to close friends</li>
						<li><i class="fas fa-plus"></i> Add to group</li>
						<li><i class="fas fa-ban"></i> Block</li>
					</ul>
				</div>
			</div>
			<div class="card-body msg_card_body" id="chats">
				
			</div>
			<div class="card-footer">
				<div class="input-group">
					<div class="input-group-append">
						<input id="files" onchange="change(this)" type="file"
							style="display: none"> <label
							class="input-group-text attach_btn" for="files"><i
							class="fas fa-paperclip"></i></label>
					</div>
					<textarea name="" class="form-control type_msg" id="type_msg"
						placeholder="Type your message..."></textarea>
					<div class="input-group-append" onclick="send()">
						<span class="input-group-text send_btn"><i
							class="fas fa-location-arrow"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="response">
		
	</div>
	<div id="myModal" class="modal">
		<span class="closebtn">&times;</span> <img class="modal-content"
			id="img01">
		<div id="caption"></div>
	</div>
</body>
<script>
var objDiv = document.getElementById("chats");
function load() {
	//alert();
	  fetch();
}
var interval=setInterval(fetch,3000);
var readInterval=setInterval(markAsRead,2000);
var num1=<%=senderNumber%>;
var num2=<%=receiverNumber%>;
function send(){
	var msg=document.getElementById('type_msg').value;
	document.getElementById('type_msg').value="";
	if(!isEmpty(msg)){
		var http=new XMLHttpRequest();
		http.onreadystatechange=function(){
			if(http.readyState==4){
				var time=http.responseText;
				
				senderMessage(msg,time,'unread');
				
				//document.getElementById("response").innerHTML=http.responseText;
			}
		}
		http.open("GET","MessageStore?senderNumber="+num1+"&receiverNumber="+num2+"&msg="+msg+"&msgType=text",true);
		http.send();
	}
	else{
		alert("Empty Message");
	}
	
}
function markAsRead(){
		var http=new XMLHttpRequest();
		http.onreadystatechange=function(){
			if(http.readyState==4){
				var r=http.responseText;
				//document.getElementById("response").innerHTML="read :"+r;
				
			}
		}
		http.open("GET","MessageReader?senderNumber="+num1+"&receiverNumber="+num2,true);
		http.send();
}
function fetch(){
	
	var http=new XMLHttpRequest();
	http.onreadystatechange=function(){
		if(http.readyState==4){
			var r=http.responseText;
			try{
			var obj=JSON.parse(r);
			objDiv.innerHTML="";
			for(var i=0;i<obj.length;i++){
				if(num1.toString()===obj[i].who.toString()){
					senderMessage(obj[i].message,obj[i].time,obj[i].status.toString());
				}
				else{
					receiverMessage(obj[i].message,obj[i].time);
				}
			}
			}catch(e){
				console.log(r);
			}
			
		}
	}
	http.open("GET","MessageRetriever?senderNumber="+num1+"&receiverNumber="+num2,true);
	http.send();

}
function senderMessage(msg,time,s){
	var chats=document.getElementById('chats');

	var div=document.createElement("div");
	div.classList.add("d-flex");
	div.classList.add("justify-content-end");
	div.classList.add("mb-4");
	
	var msgDiv=document.createElement("div");
	msgDiv.classList.add("msg_cotainer_send");
	
	var msgText = document.createTextNode(msg);
	msgDiv.appendChild(msgText);
	var i = document.createElement('i');
	i.classList.add('fa');
	i.classList.add('fa-check');
	if(s==='read'){
		msgDiv.appendChild(i);
	}
	
	var span=document.createElement("span");
	span.classList.add("msg_time_send");
	span.style="width:150px;"
	var timeText = document.createTextNode(time);
	span.appendChild(timeText);
	
	msgDiv.appendChild(span);
	div.appendChild(msgDiv);
	
	var imgDiv=document.createElement("div");
	imgDiv.classList.add("img_cont_msg");
	
	var img=document.createElement("img");
	img.classList.add("rounded-circle");
	img.classList.add("user_img_msg");
	img.src=<%=userProfileImg%>;
	
	imgDiv.appendChild(img);
	div.appendChild(imgDiv);
	
	chats.appendChild(div);
	objDiv.scrollTop=objDiv.scrollHeight;
}
function receiverMessage(msg,time){
	var chats=document.getElementById('chats');
	
	var div=document.createElement("div");
	div.classList.add("d-flex");
	div.classList.add("justify-content-start");
	div.classList.add("mb-4");
	
	var imgDiv=document.createElement("div");
	imgDiv.classList.add("img_cont_msg");
	
	var img=document.createElement("img");
	img.classList.add("rounded-circle");
	img.classList.add("user_img_msg");
	img.src=<%=clientProfileImg%>;
	
	imgDiv.appendChild(img);
	div.appendChild(imgDiv);
	
	var msgDiv=document.createElement("div");
	msgDiv.classList.add("msg_cotainer");
	
	var msgText = document.createTextNode(msg);
	msgDiv.appendChild(msgText);
	
	var span=document.createElement("span");
	span.classList.add("msg_time_send");
	span.style="width:150px;"
	var timeText = document.createTextNode(time);
	span.appendChild(timeText);
	
	msgDiv.appendChild(span);
	div.appendChild(msgDiv);
	
	chats.appendChild(div);
	objDiv.scrollTop=objDiv.scrollHeight;
}
function isEmpty(a){
	return a===''||a===null||a===undefined;
}
</script>
<script src="JS/Messaging.js"></script>
<script src="JS/Shop.js"></script>
</html>