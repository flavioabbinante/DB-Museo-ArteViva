


<?php


include '../config.php';

if(isset($_POST['submit'])) {
    
    // Recupera i valori inviati dal form
    $titolo = $_POST['titolo'];
    $tipo = $_POST['tipo'];
    $anno = $_POST['anno'];
    $valore = $_POST['valore'];
    $museo = $_POST['museo'];
    $artista = $_POST['artista'];
    $link_immagine = $_POST['link_immagine'];



    
    $query = "INSERT INTO opere (Titolo, Tipo, Anno, Valore, idMuseo, idArtista, LinkImmagine) 
              VALUES ('$titolo', '$tipo', '$anno', '$valore', '$museo', '$artista', '$link_immagine')";

$risultato = mysqli_query($conn, $query);   


    if ($risultato) {
        echo "Opera inserita con successo.";
       echo' <a href="../Museo.php">clicca qui per visualizzare l’opera</a>';
    } else {
        echo "Errore durante l'inserimento dell'opera: ";
    }

 
}
?>