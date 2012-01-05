function carregarInfo( banda ) {
/* criar objeto XMLHttpRequest */
xmlHttp = getXmlHttpRequest();

/* endereço do servidor */
url_servidor = "http://localhost/";

/* arquivo que gera o XML*/
url = url_servidor + "xml.php";

/* número aleatório para evitar cache */
url = url + "?id=" + Math.random();

/* abrir objeto informando método http e adicionando a informação da banda */
xmlHttp.open( "GET", url + "&banda=" + banda , true);

/* definir função a ser chamada quando o XML estiver carregado */
xmlHttp.onreadystatechange = xmlPronto;

/* enviar dados */
xmlHttp.send("");
document.getElementById( 'titulo_info' ).innerHTML = '<img src="loading.gif">';
}


function xmlPronto() {
if ( xmlHttp.readyState == 4 ) {

/* carregar objeto DOM */
xml = getXmlDoc( xmlHttp.responseText );

/* adquirindo o elemento banda */
banda = xml.getElementsByTagName( "banda" )[0];

/* adquirindo o elemento nome */
nome = banda.childNodes[1].childNodes[0].nodeValue;

/* músico - numeração ímpar no primeiro childNode */
musico = banda.getElementsByTagName( "integrantes" )[0].childNodes[1].childNodes[1].childNodes[0].nodeValue;

/* album - numeração ímpar no primeiro childNode */
album = banda.getElementsByTagName( "discografia" )[0].childNodes[1].childNodes[1].childNodes[0].nodeValue;

/* preencher campos */
document.getElementById( 'nome' ).innerHTML = nome;
document.getElementById( 'integrantes' ).innerHTML = musico;
document.getElementById( 'discografia' ).innerHTML = album;
document.getElementById( 'titulo_info' ).innerHTML = '<b><i>info</i></b>';
}
}
carregarInfo( 'Angra' );
