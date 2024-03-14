!
<?php


include '../config.php';

if(isset($_POST['submit'])) {
    
    // Recupera i valori inviati dal form
    $nomeCitta = $_POST['nomeCitta'];
    $Nazione = $_POST['Nazione'];



    
    $query = "INSERT INTO citta (nomeCitta, Nazione) 
              VALUES ('$nomeCitta', '$Nazione')";

$risultato = mysqli_query($conn, $query);   


    if ($risultato) {
        echo "Opera inserita con successo.";
       echo' <a href="../Museo.php">clicca qui per tornare alla pagina principale </a>';
    } else {
        echo "Errore durante l'inserimento dell'opera: ";
    }

 
}
?>