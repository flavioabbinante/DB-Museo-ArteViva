<?php
include 'config.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="./style.css">
    <title>Ricerca Completata</title>
</head>
<body class="vh-100">
    <!--NAVBAR-->
<nav class="navbar navbar-expand-lg bg-transparent">
  <div class="container">
       <!-- LOGO -->
    <a class="navbar-brand fs-4" href="index.php">Museo ArteViva</a>
  <!-- BOTTONI -->
    <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
     <!-- SIDEBAR -->
    <div class="sidebar offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
         <!-- SIDEBAR HEADER -->
        <h5 class="offcanvas-title text-white border-bottom" id="offcanvasNavbarLabel">Museo ArteViva</h5>
        <button type="button" class="btn-close btn-close-white shadow-none" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
       <!-- SIDEBAR BODY -->
      <div class="offcanvas-body d-flex flex-column flex-lg-row p-4 p-lg-0">
        <ul class="navbar-nav justify-content-center align-item-center fs-5 flex-grow-1 pe-3">
          <li class="nav-item mx-2">
            <a class="nav-link active" aria-current="page" href="index.php">Home</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="#info">Info</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="search.php">Ricerca</a>
          </li>
        
        
          
        </ul>

        
          <!-- ACCESSO PRIVATO -->
        <div class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3">
            <a href="login.php" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: 	#a9a9a9">Accesso Privato</a>
        </div>
      </div>
    </div>
  </div>
</nav>








    <?php
    $data = $_GET['data'];
    
    $query = "SELECT 
    opere.LinkImmagine AS Link_Opera,
    opere.Titolo AS Titolo_Opera,
    opere.Tipo AS Tipo_Opera,
    opere.Anno AS Anno_Opera,
    opere.Valore AS Valore_Opera,
    artisti.Nome AS Nome_Artista,
    artisti.Cognome AS Cognome_Artista,
    artisti.Nazionalita AS Nazionalita_Artista,
    artisti.DataNascita AS Data_Nascita_Artista,
    artisti.DataMorte AS Data_Morte_Artista,
    citta.nomeCitta AS Nome_Citta_Museo,
    citta.Nazione AS Nazione_Museo,
    musei.nomeMuseo AS Nome_Museo,
    opere.LinkImmagine AS Link_Immagine
FROM 
    opere
JOIN 
    artisti ON opere.idArtista = artisti.idArtista
JOIN 
    musei ON opere.idMuseo = musei.idMuseo
JOIN 
    citta ON musei.idCitta = citta.idCitta WHERE opere.Titolo='$data' or artisti.Cognome='$data' or musei.nomeMuseo='$data' or citta.nomeCitta='$data' or citta.Nazione='$data'";

    
    $result = mysqli_query($conn,$query);

    echo '<div class="grid">';

    if(mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
        
                echo '<div class="img-wrapper">';
                echo '<img class="blur" src="' . $row["Link_Opera"] . '">';
                    echo '<div class="content fade">';
                    echo $row["Titolo_Opera"];
                    echo '<br>';
                    echo $row["Tipo_Opera"];
                    echo '<br>';
                    echo $row["Anno_Opera"];
                    echo '<br>';
                    echo $row["Valore_Opera"];
                    echo '<br>';
                    echo $row["Nome_Museo"];
                    echo '<br>';
                    echo $row["Nome_Artista"];
                    echo "&nbsp";
                    echo $row["Cognome_Artista"];
                    echo '</div>';
                echo '</div>';
          
        }
    } else {
        echo "Nessun risultato trovato";
    }
    echo '</div>';
    ?>
</body>
</html>