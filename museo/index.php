<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomePage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">

</head>
<body class="vh-100 overflow-hidden">
    <!--NAVBAR-->
<nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
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
            <a class="nav-link active" aria-current="page" href="#">Home</a>
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
<main>
    <section class="w-100 vh-100 d-flex flex-column justify-content-center align-items-center text-white fs-1">
    <a href="Museo.php" style="font-size: 1.5em; background-color: rgba(255, 255, 255, .4)" class="text-black text-decoration-none px-3 py-1 rounded-4 shadow-none">Accedi al museo </a>

    </section>
</main>
</body>
</html>