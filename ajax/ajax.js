<?php
/* Função utilizada para obter um objeto HttpRequest */
function getXmlHttpRequest() {
var xmlHttp = null;
try {
// Objeto utilizando no Firefox, Opera e Safari
xmlHttp = new XMLHttpRequest();
}
catch(e) {
try {
// Objeto utilizado no Internet Explorer 6.0
xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
}
catch(e) {
// Objeto utilizado no Internet Explorer 5.5
xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
}
}
return xmlHttp;
}


/* função utilizada para abrir um objeto DOM */
function getXmlDoc( xml ) {
if (window.DOMParser) {
parser = new DOMParser();
xmlDoc = parser.parseFromString( xml , "text/xml" );
return xmlDoc;
}
else {
// Internet Explorer
xmlDoc = new ActiveXObject( "Microsoft.XMLDOM" );
xmlDoc.async= "false";
xmlDoc.loadXML( text );
return xmlDoc;
}
}
?>
