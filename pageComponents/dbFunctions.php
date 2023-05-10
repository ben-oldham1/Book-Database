<?php
// This function initiates a database connection and returns a new MySqlI object
function connectToDatabase() {
    // Connect to the db
    $mysqli = new mysqli('localhost','root','','cw3-books');
    return $mysqli;
  }

  // This function takes GET parameters to construct a ORDER BY sql query based on user input
function createSortByQuery($sortBy) {
    // Format the ORDER BY query based on the GET parameters
    if ($sortBy == 'titleDESC'){
        $sortByQuery = 'books.title DESC';
    } elseif ($sortBy == 'yearASC'){
        $sortByQuery = 'books.publishyear ASC';
    } elseif ($sortBy == 'yearDESC'){
        $sortByQuery = 'books.publishyear DESC';
    }
    // If no GET parameters are provided, we'll default to sort by title ascending
    else {
        $sortByQuery = 'books.title ASC';
    } 
    return $sortByQuery;
  }

  // This function takes GET parameters to create a WHERE clause so only certain genres are displayed
function createGenreFilterQuery($genre) {
    if (isset($genre)){
        $genreQuery = 'WHERE genre.genreid = ' . $_GET['genre'];
    } else {
        $genreQuery = '';
    }

    return $genreQuery;
  }
?>