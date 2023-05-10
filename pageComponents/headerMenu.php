<!-- This file defines the header menu to be included in all other files -->

<?php
// This function takes the name of a page as input, returns the css class 'active' if that input is currently active
function active($currect_page){
  // Converts the request URL into an array of strings, delimited at '/' 
  $url_array =  explode('/', $_SERVER['REQUEST_URI']) ;
  // We want the last element of the URL array, which is the page name
  $pagename = end($url_array);  

  // Compare the currently active page to our input
  if($currect_page == $pagename){
      echo 'active'; //class name in css 
  } 
}
?>

<nav class="navbar navbar-expand-lg bg-body-tertiary">

  <div class="container-fluid">

    <a class="navbar-brand" href="search.php">
      <i class="bi bi-book"></i>
      BOOK DATABASE
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item">
            <a class="nav-link <?php active('search.php');?>" href="search.php">Search</a>
        </li>

        <li class="nav-item">
            <a class="nav-link <?php active('browse.php');?>" href="browse.php">Browse</a> 
        </li>

      </ul>

      <form class="d-flex" role="search">
        <button class="btn btn-sm btn-outline-secondary" type="button" onclick="toggleDarkMode()" id="colourModeToggle">
            <i class="bi bi-sun"></i> Light mode
        </button>
      </form>

    </div>
    </div>

</nav>