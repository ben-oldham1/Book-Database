<!doctype html>
<html lang="en" data-bs-theme="dark" id="colourModeElement">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View book</title>

    <?php include 'pageComponents/headLinks.php';?>
</head>

<body onload="setColourMode()">

    <?php include 'pageComponents/headerMenu.php';?>

    <div class="container">
        <?php
            // Connect to the db
            $mysqli = new mysqli('localhost','root','','cw3-books');

            // Get the ISBN URL parameter
            $ISBN = $_GET['isbn'];

            // Format the SQL query
            $query = "
                SELECT
                    books.ISBN13,
                    books.title,
                    books.publishyear,
                    books.description,
                    books.pagecount,
                    books.amazonlink,
                    authors.firstname, 
                    authors.surname,
                    authors.bio,
                    genre.genrename,
                    genre.genreid,
                    publisher.publishername,
                    publisher.hqlocation,
                    publisher.website,
                    publisher.foundedyear,
                    publisher.ceoname,
                    publisher.ceostart
                FROM
                    authorOfBook
                JOIN books ON authorOfBook.bookID = books.ISBN13
                JOIN authors ON authorOfBook.authorID = authors.authorID
                JOIN genre ON books.genreid = genre.genreid
                JOIN publisher ON books.publisher = publisher.publisherid
                WHERE books.ISBN13 = '" . $ISBN . "'
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
                $author_bio = $row['bio'];

                // If the book doesn't exist in the array yet, create a new entry
                if (!isset($books[$book_id])) {
                    $books[$book_id] = array(
                        'title' => $row['title'],
                        'publishyear' => $row['publishyear'],
                        'description' => $row['description'],
                        'pagecount' => $row['pagecount'],
                        'amazonlink' => $row['amazonlink'],
                        'publishername' => $row['publishername'],
                        'hqlocation' => $row['hqlocation'],
                        'foundedyear' => $row['foundedyear'],
                        'ceoname' => $row['ceoname'],
                        'ceostart' => $row['ceostart'],
                        'website' => $row['website'],
                        'genreid' => $row['genreid'],
                        'genrename' => $row['genrename'],
                        'authors' => array(),
                        'authorsbio' => array()
                    );
                }

                // Add the author name to the book's list of authors
                $books[$book_id]['authors'][] = $author_name;
                $books[$book_id]['authorsbio'][] = $author_bio;
            }

            // Close the result set and database connection
            $result->close();
            $mysqli->close();

            // Loop through each item in the $books array
            foreach ($books as $book_id => $book) {
        ?>

        <div class="row my-3">

            <div class="col-lg-4">
                <img src="coverImages/<?= $book_id; ?>.jpg" class="d-block mx-auto w-75 h-lg-50" alt="Book cover image">
            </div>
            
            <div class="col-lg-8">

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="browse.php?genre=<?= $book['genreid']; ?>"><?= $book['genrename']; ?></a></li>
                        <li class="breadcrumb-item active" aria-current="page"><?= $book['title']; ?></li>
                    </ol>
                </nav>

                <hr class="mt-2">
                
                <div class="row">
                    <div class="col-lg-2 text-center font-lg">
                        <p><i class="bi bi-layers"></i> <?= $book['pagecount']; ?> pages</p>
                    </div>
                    <div class="col-lg-2 text-center font-lg">
                        <p><i class="bi bi-hourglass-split"></i> <?= $book['publishyear']; ?></p>
                    </div>
                    <div class="col-lg-4 text-center font-lg">
                        <p><i class="bi bi-bookmark"></i> ISBN-13: <?= $book_id; ?></p>
                    </div>
                    <div class="col-lg-4 text-center font-lg">
                        <p><i class="bi bi-link-45deg"></i> <a href="<?= $book['amazonlink']; ?>">Buy it on amazon</a></p>
                    </div>

                </div>


                <hr class="mt-2">

                <div class="row">
                    
                    <p class="serif font-lg">
                        <?= $book['description']; ?>
                    </p>

                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                About the author
                            </button>
                            </h2>
                            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body serif font-lg">
                                <?= implode("<br><hr>", $book['authorsbio']); ?></div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                About the publisher
                            </button>
                            </h2>
                            <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">

                            <p class="font-lg"><i class="bi bi-buildings"></i> <?= $book['publishername']; ?></p>
                                
                            <ul class="list-group">
                                <li class="list-group-item">Founded: <strong><?= $book['foundedyear']; ?></strong></li>
                                <li class="list-group-item">Headquarters: <strong><?= $book['hqlocation']; ?></strong></li>
                                <li class="list-group-item">CEO: <strong><?= $book['ceoname']; ?> (<?= $book['ceostart']; ?>-present)</strong></li>
                                <li class="list-group-item">Website: <a href="<?= $book['website']; ?>"><?= $book['website']; ?></a></li>
                            </ul>

                            </div>
                        </div>
                    </div>

                </div>


            </div> 

            <?php 
                    }
            ?>

        </div>

    </div>
        
</body>

</html>