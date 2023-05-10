<!doctype html>
<html lang="en" data-bs-theme="dark" id="colourModeElement">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search books</title>

    <?php include 'pageComponents/headLinks.php'; ?>

</head>

<body onload="setColourMode()">

    <?php include 'pageComponents/headerMenu.php'; ?>

    <div>
        <div class="container">

            <div class="row">

                <div class="card mt-5 mb-3 mx-auto">
                    <div class="card-body m-3 py-0">

                        <form method="POST">
                            <div class="row g-2 mx-auto">

                                <?php
                                // This file has some functions to do certain database operations
                                include 'pageComponents/dbFunctions.php';
                                ?>

                                <?php
                                // Call my function to connect to the db
                                $mysqli = connectToDatabase();

                                // Retrieve all the books in the database so we can count them
                                if (
                                    $countResult = $mysqli->query("
                                        SELECT * FROM books
                                    ")
                                ) {
                                    // Display the number of books
                                    echo '<h3 class="text-center">Search ' . $countResult->num_rows . ' books</h3>';
                                }
                                // If error occurs, echo it 
                                else {
                                    echo $mysqli->error;
                                }
                                ?>

                                <div class="col-md-2">
                                    <select class="form-select" name="searchBy" id="searchBy"
                                        onchange="changePlaceholder()" aria-label="Default select example">
                                        <option value="title" selected>Title</option>
                                        <option value="author">Author</option>
                                        <option value="year">Publish year</option>
                                        <option value="ISBN">ISBN-13</option>
                                    </select>
                                </div>

                                <div class="col-md-8">
                                    <input type="text" name="query" id="query" class="form-control"
                                        placeholder="E.g. To Kill A Mockingbird" aria-label="Search bar">
                                </div>

                                <div class="col-md-2">
                                    <button class="btn btn-outline-info w-100" type="submit"> <i
                                            class="bi bi-search"></i> </button>
                                </div>

                                <p class="text-center mt-3 mb-0">Enter a search query or <a href="browse.php">browse
                                        all</a></p>

                                <?php
                                // GET parameters from the URL
                                $searchBy = $_POST['searchBy'];
                                $searchText = $_POST['query'];

                                // Format the WHERE condition based on the GET parameters
                                if ($searchBy == 'title') {
                                    $whereCondition = "LOWER(books.title) LIKE LOWER('%" . $searchText . "%')";
                                } elseif ($searchBy == 'ISBN') {
                                    $whereCondition = "books.ISBN13 = '" . $searchText . "'";
                                } elseif ($searchBy == 'author') {
                                    $whereCondition = "LOWER(authors.firstname) LIKE LOWER('%" . $searchText . "%')
                                                        OR LOWER(authors.surname) LIKE LOWER('%" . $searchText . "%')";
                                } elseif ($searchBy == 'year') {
                                    $whereCondition = "books.publishyear LIKE '%" . $searchText . "%'";
                                }
                                ;

                                // Format the query
                                $query = "
                                        SELECT
                                            books.ISBN13,
                                            books.title,
                                            books.publishyear,
                                            books.description,
                                            authors.firstname,
                                            authors.surname,
                                            genre.genreid,
                                            genre.genrename
                                        FROM
                                            authorOfBook
                                        JOIN books ON authorOfBook.bookID = books.ISBN13
                                        JOIN authors ON authorOfBook.authorID = authors.authorID
                                        JOIN genre ON books.genreid = genre.genreid
                                        WHERE " . $whereCondition . ";
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
                                ?>


                                <?php
                                // Display the number of results returned by the search
                                echo '<p class="text-center mb-0"><strong>Found ' . count($books) . ' results</strong></p>';
                                ?>

                            </div>
                    </div>

                </div>


            </div>
            </form>

        </div>

    </div>

    <div class="container">
        <div class="row mx-1 my-2 mx-lg-0 row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5 g-5">

            <?php
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
                        <h6 class="text-center my-0 serif">
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

</body>

</html>