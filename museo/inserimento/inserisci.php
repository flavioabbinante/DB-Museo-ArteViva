<?php
include '../config.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="inserisci.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="vh-100">
    <!--NAVBAR-->
<nav class="navbar navbar-expand-lg bg-transparent">
  <div class="container">
       <!-- LOGO -->
    <a class="navbar-brand fs-4" href="../index.php">Museo ArteViva</a>
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
            <a class="nav-link active" aria-current="page" href="../index.php">Home</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="../Query.php">Query Aggiuntive</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="../search.php">Ricerca</a>
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


<!--OPERE-->
<form method="post" action="inserisciopera.php" class="form1">
    Titolo: <input type="text" name="titolo"><br>
    Tipo: <input type="text" name="tipo"><br>
    Anno: <input type="text" name="anno"><br>
    Valore: <input type="text" name="valore"><br>
    Museo:
    <select name="museo">
      
        <?php
       
       

        $query = "SELECT idMuseo, nomeMuseo FROM musei";
        $risultato = mysqli_query($conn, $query);


        while ($riga = mysqli_fetch_assoc($risultato)) {
            echo "<option value='" . $riga['idMuseo'] .   "'>". $riga['nomeMuseo'] ."</option>";
        }

       
        
   echo' </select><br>
    Artista:
    <select name="artista">';
      
       
       
        $query = "SELECT idArtista, Nome, Cognome FROM artisti";
        $risultato = mysqli_query($conn, $query);
        
      
        while ($riga = mysqli_fetch_assoc($risultato)) {
            echo "<option value='" . $riga['idArtista'] . "'>" . $riga['Nome'] . " " . $riga['Cognome'] . "</option>";
        }
        ?>
    </select><br>
    Link Immagine: <input type="text" name="link_immagine"><br>
    <input type="submit" name="submit" value="Submit" />
</form>


<!--MUSEI-->


<form method="post" action="inseriscimuseo.php" class="form1">
    Museo ArteViva: <input type="text" name="nomeMuseo"><br>

    Città:
    <select name="citta">
      
        <?php
       
        $query = "SELECT idCitta, nomeCitta FROM citta";
        $risultato = mysqli_query($conn, $query);

        
        while ($riga = mysqli_fetch_assoc($risultato)) {
            echo "<option value='" . $riga['idCitta'] .   "'>". $riga['nomeCitta'] ."</option>";
        }

        ?>
        
    <input type="submit" name="submit" value="Submit" />
   
</form>



<!--ARTISTI-->


<form method="post" action="inserisciartista.php" class="form1">
    Nome Artista: <input type="text" name="nome"><br>
    Cognome: <input type="text" name="cognome"><br>
    Nazionalità: <input type="text" name="nazionalita" maxlength="3"><br>
    Data nascita: <input type="date"  name="datanascita" />
    Data morte: <input type="date"  name="datamorte" />
    
    <input type="submit" name="submit" value="Submit" />
</form>

<!--CITTA'-->


<form method="post" action="inseriscicitta.php" class="form1">
    Nome Citta: <input type="text" name="nomeCitta"><br>
    Nazione: <input type="text" name="Nazione"  maxlength="3"><br>
    
    <input type="submit" name="submit" value="Submit" />
</form>



</body>
</html>