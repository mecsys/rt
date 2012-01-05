<?php
/* importar discoteca */
include( 'discoteca.php' );

/* capturar string pelo método GET */
$banda = $_GET['banda'];

/* capturar índice do array da banda */
for ( $i = 0 ; $i <= count($discoteca) ; $i++ ) {
	if( $discoteca[$i]['nome'] == $banda ) {
		$ID = $i;
		break;
	}
}

/* criar um objeto XMLWriter */
$xml = new XMLWriter;
/* enviar xml para o buffer */
$xml->openURI('php://output');
/* definir versão e codificação */
$xml->startDocument('1.0', 'UTF-8' );
/* identar documento */
$xml->setIndent(true);

/* escrever elementos e atributos */
$xml->startElement('banda'); //<banda>
$xml->writeElement('nome', $discoteca[$ID]['nome'] ); // <nome>nome da banda</nome>

/* insere elemento dos integrantes */
$xml->startElement('integrantes'); // <integrantes>
for ( $i = 0 ; $i < count( $discoteca[$ID]['integrantes'] ) ; $i++ ) {
$xml->startElement( 'musico' );// <musico>
$xml->writeAttribute('id', 'musico'.$i ); // <musico id="id do musico">
$xml->writeElement('nome', $discoteca[$ID]['integrantes'][$i] ); // <nome>nome do musico</nome>
$xml->endElement(); // </musico>
}
$xml->endElement(); // </integrantes>

/* insere elemento discografica */
$xml->startElement('discografia'); // <discografia>
for ( $i = 0 ; $i < count( $discoteca[$ID]['discografia'] ) ; $i++ ) {
$xml->startElement( 'album' ); // <album>
$xml->writeAttribute('id', 'album'.$i );
$xml->writeElement('nome', $discoteca[$ID]['discografia'][$i] );
$xml->endElement(); // </album>
}
$xml->endElement(); // </discografia>

/* fecha nodo raiz */
$xml->endElement(); // </banda>

/* fecha documento */
$xml->endDocument();
$xml->flush(); 
sleep(100); 
?>
