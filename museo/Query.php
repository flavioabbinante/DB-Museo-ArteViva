<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visualizzazione Query</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
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
            <a class="nav-link" href="Query.php">Query aggiuntive</a>
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

<div style="text-align:center">
<h2>Visualizzazione Query</h2>

<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    <label for="query">Seleziona la query:</label>
    <select name="query" id="query" onchange="showCitySelection(this.value)">
        <option value="0">Seleziona una Query</option>
        <option value="1">Numero di opere di ciascun autore per ogni museo</option>
        <option value="2">Selezionare solo gli artisti che hanno almeno 2 quadri in ogni museo</option>
        <option value="3">Selezionare il numero dei musei in ogni città</option>
        <option value="4">Selezionare il numero di quadri di un certo autore in ogni città</option>
        <option value="5">Calcolare il valore medio delle opere per ogni museo</option>
        <option value="6">Selezionare il numero di quadri e il loro valore complessivo raggruppati per anno</option>
        <option value="7">Quali autori hanno prodotto opere con un valore medio maggiore</option>
        <option value="8">Contare il numero di quadri per cui il valore medio in un determinato anno è maggiore di un valore dato</option>
        <option value="9">In un determinato museo, raggruppare tutte le opere per nazionalità dell'artista</option>
        <option value="10">Selezionare il numero dei musei per una città specifica</option>
    </select>
    <div id="citySelection" style="display: none;">
        <label for="city">Seleziona la città:</label>
        <select name="city" id="city">
            <option value="Parigi">Parigi</option>
            <option value="Londra">Londra</option>
            <option value="Vienna">Vienna</option>
            <option value="Amsterdam">Amsterdam</option>
            <option value="Amburgo">Amburgo</option>
            <option value="New York">New York</option>
            <option value="Aia">Aia</option>
            <option value="Dresda">Dresda</option>
            <option value="Madrid">Madrid</option>
            <option value="Monaco di Baviera">Monaco di Baviera</option>
            <option value="Firenze">Firenze</option>
            <option value="Praga">Praga</option>
            <option value="Roma">Roma</option>
            <option value="Venezia">Venezia</option>
        </select>
    </div>
    <button type="submit" id="submitButton" style="display: none;">Esegui Query</button>
</form>
</div>
<script>
    function showCitySelection(selectedValue) {
        var citySelection = document.getElementById("citySelection");
        var submitButton = document.getElementById("submitButton");
        if (selectedValue === '10') {
            citySelection.style.display = "block";
            submitButton.style.display = "block";
        } else {
            citySelection.style.display = "none";
            submitButton.style.display = "block"; // Mostra il pulsante anche per le altre query
        }
    }
</script>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Connessione al Annobase
    $conn = mysqli_connect("localhost","root", "", "db_gestioneopere");
    if(!$conn){
        die("Qualcosa non ha funzionato");
    }

    $selectedQuery = $_POST["query"];

    // Funzione per eseguire e visualizzare la query
    function executeAndDisplayQuery($conn, $query, $queryDescription)
    {
        echo "<h3>$queryDescription</h3>";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            echo "<table><tr>";
            $row = $result->fetch_assoc();
            foreach ($row as $key => $value) {
                echo "<th>$key</th>";
            }
            echo "</tr>";

            // Output dei dati
            do {
                echo "<tr>";
                foreach ($row as $value) {
                    echo "<td>$value</td>";
                }
                echo "</tr>";
            } while ($row = $result->fetch_assoc());

            echo "</table>";
        } else {
            echo "Nessun risultato trovato.";
        }
    }

    // Esegui la query selezionata
    switch ($selectedQuery) {
        case "1":
            executeAndDisplayQuery($conn, "SELECT a.Nome, a.Cognome, m.nomeMuseo, COUNT(o.idOpera) AS NumeroOpere
               FROM artisti a
               INNER JOIN opere o ON a.idArtista = o.idArtista
               INNER JOIN musei m ON o.idMuseo = m.idMuseo
               GROUP BY a.idArtista, m.idMuseo;", "Numero di opere di ciascun autore per ogni museo");
            break;
        case "2":
            executeAndDisplayQuery($conn, "SELECT DISTINCT a.Nome, a.Cognome
               FROM artisti a
               INNER JOIN opere o ON a.idArtista = o.idArtista
               GROUP BY a.idArtista, o.idMuseo
               HAVING COUNT(o.idOpera) >= 2;", "Selezionare solo gli artisti che hanno almeno 2 quadri in ogni museo");
            break;
        case "3":
            executeAndDisplayQuery($conn, "SELECT c.NomeCitta, COUNT(DISTINCT m.idMuseo) AS NumeroMusei
               FROM citta c
               LEFT JOIN musei m ON c.idCitta = m.idCitta
               GROUP BY c.idCitta;", "Selezionare il numero dei musei in ogni città");
            break;
        case "4":
            executeAndDisplayQuery($conn, "SELECT a.Nome, a.Cognome, c.NomeCitta, COUNT(o.idOpera) AS NumeroOpere
               FROM artisti a
               INNER JOIN opere o ON a.idArtista = o.idArtista
               INNER JOIN musei m ON o.idMuseo = m.idMuseo
               INNER JOIN citta c ON m.idCitta = c.idCitta
               GROUP BY a.idArtista, c.idCitta;", "Selezionare il numero di quadri di un certo autore in ogni città");
            break;
        case "5":
            executeAndDisplayQuery($conn, "SELECT m.nomeMuseo, AVG(Valore) AS ValoreMedioOpere
               FROM musei m
               INNER JOIN opere o ON m.idMuseo = o.idMuseo
               GROUP BY m.idMuseo;", "Calcolare il valore medio delle opere per ogni museo");
            break;
        case "6":
            case "6":
                executeAndDisplayQuery($conn, "SELECT Anno, COUNT(idOpera) AS NumeroQuadri, SUM(Valore) AS ValoreComplessivo
                FROM opere
                GROUP BY Anno;", "Selezionare il numero di quadri e il loro valore complessivo raggruppati per anno");
            break;
                break;            
            break;
        case "7":
            executeAndDisplayQuery($conn, "SELECT a.Nome, a.Cognome
               FROM artisti a
               INNER JOIN opere o ON a.idArtista = o.idArtista
               GROUP BY a.idArtista
               HAVING AVG(o.Valore) > (SELECT AVG(Valore) FROM opere);", "Quali autori hanno prodotto opere con un valore medio maggiore");
            break;
        case "8":
            executeAndDisplayQuery($conn, "SELECT a.Nome, a.Cognome, YEAR(Anno) AS Anno, COUNT(o.idOpera) AS NumeroOpere
               FROM opere o
               INNER JOIN artisti a ON o.idArtista = a.idArtista
               GROUP BY a.idArtista, YEAR(Anno)
               HAVING AVG(Valore) > 500000;", "Contare il numero di quadri per cui il valore medio in un determinato anno è maggiore di un valore dato");
            break;
        case "9":
            executeAndDisplayQuery($conn, "SELECT m.nomeMuseo, a.Nazionalita, COUNT(o.idOpera) AS NumeroOpere
               FROM musei m
               INNER JOIN opere o ON m.idMuseo = o.idMuseo
               INNER JOIN artisti a ON o.idArtista = a.idArtista
               GROUP BY m.idMuseo, a.Nazionalita;", "In un determinato museo, raggruppare tutte le opere per nazionalità dell'artista");
            break;
        case "10":
            $city = $_POST['city'];
            executeAndDisplayQuery($conn, "SELECT COUNT(idMuseo) AS NumeroMusei
               FROM musei
               WHERE idCitta = (SELECT idCitta FROM citta WHERE NomeCitta = '$city');", "Selezionare il numero dei musei per una città specifica");
            break;
        default:
            echo "Seleziona una query valida.";
    }

    $conn->close();
}
?>

</body>
</html>
