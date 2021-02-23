var l;
function getLiveLocation(id){
	console.log("Clicked :"+id);
	l=document.getElementById(id.toString());
  if (navigator.geolocation) {
	 
    navigator.geolocation.getCurrentPosition(showPosition);
    l.value="Tracking...";
  } else { 
    alert("Geolocation is not supported by this browser.");
  }


}
function showPosition(position) {
  
  l.value(position.coords.latitude+" "+position.coords.longitude);
  //alert("Latitude: " + x + "\nLongitude: " + y);
  console.log(x+" "+y);
 // displayLocation(x,y);
}
function show(id){
	var comp=document.getElementById(id.toString());
	if(comp.type==='password'){
		comp.type='text';
	}
	else{
		comp.type='password';
	}
}
function isEmpty(a){
	return a===''||a===null||a===undefined;
}