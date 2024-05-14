
<?php


include '../config.php';

if(isset($_POST['submit'])) {
    
    $nomeMuseo = $_POST['nomeMuseo'];
    $citta = $_POST['citta'];


    
    $query = "INSERT INTO musei (NomeMuseo, idCitta) 
              VALUES ('$nomeMuseo', '$citta')";

$risultato = mysqli_query($conn, $query);   


    if ($risultato) {
        echo "Opera inserita con successo.";
       echo' <a href="../index.php">cper tornare alla pagina principale</a>';
    } else {
        echo "Errore durante l'inserimento del museo: ";
    }

 
}
?>