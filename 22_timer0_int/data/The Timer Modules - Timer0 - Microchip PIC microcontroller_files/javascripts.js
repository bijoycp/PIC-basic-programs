var table_strings = new Array();
var table_refs = new Array();
var table_orstates = new Array();

function OnKeyPressEnterCheck(e) {
	if(window.event){ // IE
		var keynum = e.keyCode
	}else if(e.which){ // Netscape/Firefox/Opera
		var keynum = e.which
	}
	var keychar = String.fromCharCode(keynum)	
	if (keynum==13){
		return 1;
	}else{
		return 0;
	}
}



function ShowPic(picname) {
OpenWin = window.open("","CtrlWindow","toolbar=no,menubar=yes,location=no,scrollbars=yes,resizable=yes,status=yes,width=800,height=600,left=10,top=10,");
doc = OpenWin.document;
doc.write('<HTML><HEAD><TITLE>Enlarged Image<\/TITLE><\/HEAD><BODY bgcolor="white" onBlur="self.focus()">');
doc.write('<center><IMG SRC="' + picname + '">');
doc.write('<\/center><\/BODY><\/HTML>');
doc.close();
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}

}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//*****************************************************
//*****************************************************
function postFragmentinnerHTML(fragment_url,post_query,element_id){
	var xmlhttp = null;
	var element = document.getElementById(element_id);
	
	if (window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest(); // code for IE7+, Firefox, Chrome, Opera, Safari
	}else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); // code for IE6, IE5
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200){
			element.innerHTML= xmlhttp.responseText;
		}
	}
	xmlhttp.open("POST",fragment_url,true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(post_query);
}

function loadFragmentNoReturn(fragment_url) {
	var xmlhttp = null;
	if (window.XMLHttpRequest) { 
		xmlhttp=new XMLHttpRequest(); //Mozilla
	}else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); //not Mozilla? Maybe IE?
	}
	xmlhttp.open("GET", fragment_url);
	xmlhttp.onreadystatechange = function() {
	}
	xmlhttp.send(null);
}

function loadFragment(fragment_url,element_id) {
	var xmlhttp = null;
    var element = document.getElementById(element_id);
	if (window.XMLHttpRequest) { 
		xmlhttp=new XMLHttpRequest(); //Mozilla
	}else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); //not Mozilla? Maybe IE?
	}
    //element.innerHTML = '<p><em>Loading ...</em></p>';
    xmlhttp.open("GET", fragment_url);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            element.value= xmlhttp.responseText;
        }
    }
    xmlhttp.send(null);
}
	
function loadFragmentinnerHTML(fragment_url,element_id) {

	var xmlhttp = null;
    var element = document.getElementById(element_id);
    
	if (window.XMLHttpRequest) { 
		xmlhttp=new XMLHttpRequest(); //Mozilla
	}else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); //not Mozilla? Maybe IE?
	}

    xmlhttp.open("GET", fragment_url);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            element.innerHTML= xmlhttp.responseText;
        }
    }
    xmlhttp.send(null);
}	


//*****************************************************
//*****************************************************
function setCookie(c_name,value,expiredays){
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie=c_name+ "=" +escape(value)+
				((expiredays==null) ? "" : ";expires="+exdate.toGMTString())+";path=/";
}

function getCookie(c_name){
	if (document.cookie.length>0){
		c_start=document.cookie.indexOf(c_name + "=");
		if (c_start!=-1){ 
			c_start=c_start + c_name.length+1; 
			c_end=document.cookie.indexOf(";",c_start);
			if (c_end==-1) c_end=document.cookie.length;
			return unescape(document.cookie.substring(c_start,c_end));
		} 
	}
	return "";
}
//+++++++++++++++++++++++++++++++++++++++++

function jumpToThis(URL,From,TheMan){
	loadFragmentNoReturn('http://www.pcbheaven.com/scripts/ad_tracking.php?n='+TheMan+'&l='+From);
	 _gat._getTrackerByName()._trackEvent('ads', TheMan);
	setTimeout('document.location ="'+URL+'"', 200);
}

//+++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++

function validateEmail(e) {
ok = "1234567890qwertyuiop[]asdfghjklzxcvbnm.@-_QWERTYUIOPASDFGHJKLZXCVBNM";

for(i=0; i < e.length ;i++){
if(ok.indexOf(e.charAt(i))<0){ 
return (false);
}	
} 
if (document.images) {
re = /(@.*@)|(\.\.)|(^\.)|(^@)|(@$)|(\.$)|(@\.)/;
re_two = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
if (!e.match(re) && e.match(re_two)) {
return (-1);		
} 

}

}

//+++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++

function trim(inputString) {
   if (typeof inputString != "string") { return inputString; }
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == " ") { 
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   ch = retValue.substring(retValue.length-1, retValue.length);
   while (ch == " ") { 
      retValue = retValue.substring(0, retValue.length-1);
      ch = retValue.substring(retValue.length-1, retValue.length);
   }
   while (retValue.indexOf("  ") != -1) { 
      retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); 
   }
   return retValue; 
}


function URLEncode (clearString) {
  var output = '';
  var x = 0;
  clearString = clearString.toString();
  var regex = /(^[a-zA-Z0-9_.]*)/;
  while (x < clearString.length) {
    var match = regex.exec(clearString.substr(x));
    if (match != null && match.length > 1 && match[1] != '') {
    	output += match[1];
      x += match[1].length;
    } else {
      if (clearString[x] == ' ')
        output += '+';
      else {
        var charCode = clearString.charCodeAt(x);
        var hexVal = charCode.toString(16);
        output += '%' + ( hexVal.length < 2 ? '0' : '' ) + hexVal.toUpperCase();
      }
      x++;
    }
  }
  return output;
}

/////////////////////////////////////////////////////////////////
function setSelRange(inputEl, selStart, selEnd) { 
 if (inputEl.setSelectionRange) { 
  inputEl.focus(); 
  inputEl.setSelectionRange(selStart, selEnd); 
 } else if (inputEl.createTextRange) { 
  var range = inputEl.createTextRange(); 
  range.collapse(true); 
  range.moveEnd('character', selEnd); 
  range.moveStart('character', selStart); 
  range.select(); 
 } 
}

function getCaretPos (ctrl) {
	var CaretPos = 0;
	// IE Support
	if (document.selection) {
		ctrl.focus ();
		var Sel = document.selection.createRange ();
		Sel.moveStart ('character', -ctrl.value.length);
		CaretPos = Sel.text.length;
	}
	// Firefox support
	else if (ctrl.selectionStart || ctrl.selectionStart == '0')
		CaretPos = ctrl.selectionStart;
	return (CaretPos);
}


function GetURLParameterValue(URL_Str,ParamName){
	//URL_Str= window.location.href 
	ParamName = ParamName.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	var regexS = "[\\?&]"+ParamName+"=([^&#]*)";
	var regex = new RegExp( regexS );
	var results = regex.exec(URL_Str);
	if( results == null ) return ""; else return results[1];
}
