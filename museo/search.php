<?php
include 'config.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ricerca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</head>
<body class="vh-100">
    <!--NAVBAR-->
<nav class="navbar navbar-expand-lg bg-transparent">
  <div class="container">
       <!-- LOGO -->
    <a class="navbar-brand fs-4" href="#">Museo ArteViva</a>
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
            <a class="nav-link" href="Query.php">Query Aggiuntive</a>
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



    
    <div class="container">
        <h5 style="text-align:center">Qui pui cercare tutte le opere create dal tuo artista preferito e/o presenti in determinati musei e città!</h5>
        <form method="post">


        <div class="input-group mb-3" style="text-align:center">
            <input type="text" name="search" placeholder="Ricerca qui" size="50px" >
            <button name="submit" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: 	#a9a9a9">Ricerca</button>
        
</div>
        
        </form>
        <div class="container my-5">
            <table class="table">
                <?php
                if(isset($_POST['submit'])){
                    $search = $_POST['search'];

                    $sql = "SELECT 
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
                    citta ON musei.idCitta = citta.idCitta WHERE opere.Titolo='$search' or artisti.Cognome='$search' or citta.nomeCitta='$search' or citta.Nazione='$search' or musei.nomeMuseo='$search'";
                    $result = mysqli_query($conn,$sql);

                    if($result){
                     if(mysqli_num_rows($result)>0){
                     echo '<thead>
                        <tr>
                        <th>OPERA</th>
                        <th>Cognome</th>
                        <th>Nome</th>
                        <th>Nazione Autore</th>
                        <th>Museo</th>
                        <th>Nome Città Museo</th>
                        <th>Nazione Museo</th>
                        ';

                        while($row=mysqli_fetch_assoc($result)){

                        
                        echo '<tbody>
                        <tr>
                        <td><a href="searchdata.php?data='.$row['Titolo_Opera'].'">'.$row['Titolo_Opera'].'</a></td>
                        <td>'.$row['Nome_Artista'].'</td>
                        <td><a href="searchdata.php?data='.$row['Cognome_Artista'].'">'.$row['Cognome_Artista'].'</a></td>
                        <td>'.$row['Nazionalita_Artista'].'</td>
                        <td><a href="searchdata.php?data='.$row['Nome_Museo'].'">'.$row['Nome_Museo'].'</a></td>
                        <td><a href="searchdata.php?data='.$row['Nome_Citta_Museo'].'">'.$row['Nome_Citta_Museo'].'</a></td>
                        <td><a href="searchdata.php?data='.$row['Nazione_Museo'].'">'.$row['Nazione_Museo'].'</a></td>
                        </tr>
                        </tbody>';
                        }
                     }else{
                        echo '<h2 class=text-danger>Dato non presente nel database</h2>';
                     }
                    }

                }
                
       
                ?>
               
            </table>
        </div>
        
    </div>
</body>
</html>