

<?php


include '../config.php';

if(isset($_POST['submit'])) {
    
    // Recupera i valori inviati dal form
    $nome = $_POST['nome'];
    $cognome = $_POST['cognome'];
    $nazionalita = $_POST['nazionalita'];
    $datanascita = $_POST['datanascita'];
    $datamorte = $_POST['datamorte'];



    
    $query = "INSERT INTO artisti (Nome, Cognome, Nazionalita, DataNascita, DataMorte) 
              VALUES ('$nome', '$cognome', '$nazionalita', '$datanascita', '$datamorte')";

$risultato = mysqli_query($conn, $query);   


    if ($risultato) {
        echo "Opera inserita con successo.";
       echo' <a href="../Museo.php">clicca qui per tornare alla pagina principale </a>';
    } else {
        echo "Errore durante l'inserimento dell'opera: ";
    }

 
}
?>