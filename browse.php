<!doctype html>
<html lang="en" data-bs-theme="dark" id="colourModeElement">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Browse books</title>

    <?php include 'pageComponents/headLinks.php'; ?>
</head>

<body onload="setColourMode()">

    <?php include 'pageComponents/headerMenu.php'; ?>

    <div class="container mx-auto">

        <div class="row my-5">
            <div class="col-sm-5 col-md-4 col-lg-3 col-xl-2">

                <div class="sticky-top">
                    <form method="get">

                        <select class="form-select mb-3" name="sortBy" onchange="this.form.submit()">
                            <option <?php if ($_GET['sortBy'] == '') {
                                echo 'selected';
                            }
                            ; ?> value="default">Sort by...
                            </option>
                            <option <?php if ($_GET['sortBy'] == 'titleASC') {
                                echo 'selected';
                            }
                            ; ?> value="titleASC">
                                Title: ascending</option>
                            <option <?php if ($_GET['sortBy'] == 'titleDESC') {
                                echo 'selected';
                            }
                            ; ?> value="titleDESC">
                                Title: descending</option>
                            <option <?php if ($_GET['sortBy'] == 'yearASC') {
                                echo 'selected';
                            }
                            ; ?> value="yearASC">Publish
                                Year: ascending</option>
                            <option <?php if ($_GET['sortBy'] == 'yearDESC') {
                                echo 'selected';
                            }
                            ; ?> value="yearDESC">
                                Publish Year: descending</option>
                        </select>

                        <div class="d-block border rounded p-2">


                            <?php
                            // This file has some functions to do certain database operations
                            include 'pageComponents/dbFunctions.php';
                            ?>
                            <?php

                            // Call my function to connect to the db
                            $mysqli = connectToDatabase();

                            // Select the name and ID for every genre in the database
                            // In alphabetical order
                            if (
                                $result = $mysqli->query("
                            SELECT genreid, genrename
                            FROM genre 
                            ORDER BY genrename;
                        ")
                            ) {

                                // This section creates a new radio input for each genre
                                // Allowing the user to filter by genre
                                while ($row = $result->fetch_object()) {
                                    ?>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="genre" id="<?= $row->genreid; ?>"
                                            value="<?= $row->genreid; ?>" onchange="this.form.submit()" <?php if ($_GET['genre'] == $row->genreid) {
                                                  echo 'checked';
                                              }
                                              ; ?>>
                                        <label class="form-check-label" for="<?= $row->genreid; ?>">
                                            <?= $row->genrename; ?>
                                        </label>
                                    </div>

                                <?php
                                }
                            } else { // it’s an error & the query failed 
                                echo $mysqli->error;
                            }

                            $mysqli->close();
                            ?>
                            <a href="browse.php"><button class="btn btn-outline-secondary w-100 btn-sm mt-2"
                                    type="button">Reset filters</button></a>
                        </div>


                    </form>
                </div>

            </div>
            <div class="col-sm-7 col-md-8 col-lg-9 col-xl-10">
                <div class="row mx-1 mx-lg-0 row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-3 row-cols-xxl-4 g-5">

                    <?php
                    // Call my function to connect to the db
                    $mysqli = connectToDatabase();

                    // GET parameters from the URL
                    $sortBy = $_GET['sortBy'];

                    // Call my function to create the ORDER BY clause with GET parameters as input
                    $sortByQuery = createSortByQuery($sortBy);

                    // If a genre has been provided as GET parameter, we'll add a WHERE clause to only return that genre
                    $genre = $_GET['genre'];
                    $genreQuery = createGenreFilterQuery($genre);


                    // Format the query
                    $query = "
                        SELECT books.ISBN13, books.title, books.publishyear, books.description, 
                        authors.firstname, authors.surname,
                        genre.genreid, genre.genrename
                        FROM authorOfBook 
                        JOIN books ON authorOfBook.bookID = books.ISBN13 
                        JOIN authors ON authorOfBook.authorID = authors.authorID
                        JOIN genre ON books.genreid = genre.genreid
                        " . $genreQuery . "
                        ORDER BY " . $sortByQuery . ";
                    ";

                    // Execute the query and check for errors
                    if (!$result = $mysqli->query($query)) {
                        die('Error: ' . $mysqli->error);
                    }

                    // Create an empty array to store the books and authors
                    $books = array();

                    // Loop through each row of the result set and group the authors by book ISBN
                    while ($row = $result->fetch_assoc()) {
                        $book_id = $row['ISBN13'];
                        $author_name = $row['firstname'] . ' ' . $row['surname'];

                        // If the book doesn't exist in the array yet, create a new entry
                        if (!isset($books[$book_id])) {
                            $books[$book_id] = array(
                                'title' => $row['title'],
                                'publishyear' => $row['publishyear'],
                                'description' => $row['description'],
                                'genreid' => $row['genreid'],
                                'genrename' => $row['genrename'],
                                'authors' => array()
                            );
                        }

                        // Add the author name to the book's list of authors
                        $books[$book_id]['authors'][] = $author_name;
                    }

                    // Close the result set and database connection
                    $result->close();
                    $mysqli->close();

                    // Loop through all the books
                    foreach ($books as $book_id => $book) {
                        ?>
                        <div class="col">
                            <div class="vstack" style="height: 275px">
                                <h5 class="text-center mb-1 serif max-lines-2" style="flex: 1;">
                                    <?= $book['title']; ?>
                                </h5>
                                <img src="coverImages/<?= $book_id; ?>.jpg" style="max-height: 180px;"
                                    class="img-fluid mx-auto mb-3 mt-1" alt="Book cover image">
                                <h6 class="text-center my-0 serif max-lines-1">
                                    <?= implode(", ", $book['authors']) . " (" . $book['publishyear'] . ")"; ?>
                                </h6>
                            </div>

                            <hr>

                            <p class="max-lines-8 serif">
                                <?= $book['description']; ?>

                            </p>

                            <hr>

                            <a href="viewbook.php?isbn=<?= $book_id; ?>"><button class="btn btn-outline-info w-100 btn-sm"
                                    type="button">View info</button></a>

                        </div>
                    <?php
                    }
                    ?>


                </div>
            </div>
        </div>

    </div>

</body>

</html>