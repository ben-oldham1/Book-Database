-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2023 at 02:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cw3-books`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorOfBook`
--

CREATE TABLE `authorOfBook` (
  `bookID` char(13) NOT NULL,
  `authorID` int(4) NOT NULL,
  `authorOfBookID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authorOfBook`
--

INSERT INTO `authorOfBook` (`bookID`, `authorID`, `authorOfBookID`) VALUES
('9781847941831', 1, 1),
('9780241425442', 2, 2),
('9781787635098', 3, 3),
('9780553897845', 4, 4),
('9780141439747', 5, 5),
('9780679417392', 6, 6),
('9780199539277', 7, 7),
('9780745343495', 8, 8),
('9780745343495', 9, 9),
('9781250835765', 10, 10),
('9781398502857', 11, 11),
('9781838853327', 12, 12),
('9780062390622', 13, 13),
('9781712674215', 5, 14);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `firstname` varchar(24) NOT NULL,
  `surname` varchar(24) NOT NULL,
  `birthyear` char(4) NOT NULL,
  `birthplace` varchar(32) NOT NULL,
  `gender` char(1) NOT NULL,
  `bio` varchar(800) NOT NULL,
  `authorID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`firstname`, `surname`, `birthyear`, `birthplace`, `gender`, `bio`, `authorID`) VALUES
('James ', 'Clear', '1986', 'Ohio, USA', 'M', 'James Clear is a writer and speaker focused on habits, decision making, and continuous improvement. He is the author of the #1 New York Times bestseller, Atomic Habits. The book has sold over 5 million copies worldwide and has been translated into more than 50 languages. Clear is a regular speaker at Fortune 500 companies and his work has been featured in places like Time magazin and the New York Times.', 1),
('Richard ', 'Osman', '1970', 'Essex, UK', 'M', 'Richard Osman is a British TV host, scriptwriter, comedian, producer, director, and novelist. He is best known for his stint as a host on the quiz show Pointless, along with his friend Alexander Armstrong. He started his career as a scriptwriter, for shows such as Deal or No Deal and 10 O\'Clock Live.', 2),
('Robert', 'Goddard', '1954', 'Fareham, UK', 'M', 'Robert Goddard was born in Hampshire. He read History at Cambridge and worked as an educational administrator in Devon before becoming a full-time novelist. He is the author of many bestselling novels, including Into the Blue which won the first WH Smith Thumping Good Read Award and was dramatized for TV in 1997, starring John Thaw.', 3),
('George R.R.', 'Martin', '1948', 'New Jersey, USA', 'M', 'Fantasy writer George R. R. Martin\'s first novel, Dying of the Light, debuted in 1977, and by the mid-1980s he was also writing for television. In 1996 Martin published his first installment of the A Song of Ice and Fire fantasy series. He became a best-selling author in 2005 with the fourth title of the series, A Feast for Crows, paving the way for a widely celebrated TV adaptation that premiered as Game of Thrones in 2011.', 4),
('Charles', 'Dickens', '1812', 'Portsmouth, UK', 'M', 'Charles Dickens was an English writer and social critic. He created some of the world\'s best-known fictional characters and is regarded by many as the greatest novelist of the Victorian era.His works enjoyed unprecedented popularity during his lifetime and, by the 20th century, critics and scholars had recognised him as a literary genius. His novels and short stories are widely read today.', 5),
('George', 'Orwell', '1903', 'Motihari, British India', 'M', 'Eric Arthur Blair, better known by his pen name George Orwell, was an English novelist, essayist, journalist, and critic. His work is characterised by lucid prose, social criticism, opposition to totalitarianism, and support of democratic socialism.\r\n\r\nOrwell produced literary criticism, poetry, fiction and polemical journalism. He is known for the allegorical novella Animal Farm (1945) and the dystopian novel Nineteen Eighty-Four (1949).', 6),
('Jules', 'Verne', '1828', 'Nantes, France', 'M', 'Jules Verne was a French novelist, poet, and playwright. His collaboration with the publisher Pierre-Jules Hetzel led to the creation of the Voyages extraordinaires,[3] a series of bestselling adventure books. His novels, always well documented, are generally set in the second half of the 19th century, taking into account the technological advances of the time. ', 7),
('Pheobe', 'Moore', '1972', 'Nottingham, UK', 'F', 'Phoebe Moore is Associate Professor of Political Economy and Technology based at the University of Leicester School of Business and a Research Fellow at the Social Science Center Berlin.', 8),
('Jamie', 'Woodcock', '1983', 'London, UK', 'M', 'Jamie Woodcock is a researcher based in London. He is the author of The Gig Economy (Polity Press, 2019), Marx at the Arcade (Haymarket, 2019), and Working The Phones (Pluto, 2016). His research focuses on labour, work, the gig economy, platforms, resistance, organising, and videogames.', 9),
('K.J.', 'Parker', '1961', 'London, UK', 'M', 'Thomas Charles Louis Holt is a British novelist. In addition to fiction published under his own name, he writes fantasy under the pseudonym K. J. Parker. Holt was born in London, the son of novelist Hazel Holt,[2] and was educated at Westminster School, Wadham College, Oxford and The College of Law, London. He worked as a solicitor in Somerset for seven years before writing full-time.', 10),
('Eva ', 'Verde', '1980', 'London, UK', 'F', 'Eva Verde is a writer from Forest Gate, East London. She is of dual heritage. Identity and class are recurring themes throughout her work as she studies towards an MA in Prose Fiction. Eva lives in Essex with her husband, three daughters and Labrador sons.', 11),
('Sally ', 'Adee', '1975', 'London, UK', 'F', 'Sally Adee is a science and technology writer. Most recently, she was a features editor at New Scientist, where she wrote some of its most lasting content, including a 2012 feature that broke the bioelectricity technology to the general public and is cited in Yuval Noah Harari\'s Homo Deus. Adee\'s writing has appeared in The New York Times, the Economist, BBC Future, and Quartz.', 12),
('Paulo', 'Coelho', '1947', 'Rio, Brazil', 'M', 'Paulo Coelho de Souza is a Brazilian lyricist and novelist and a member of the Brazilian Academy of Letters since 2002. His novel The Alchemist became an international best-seller and he has published 28 more books since then.', 13);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN13` char(13) NOT NULL,
  `title` varchar(96) NOT NULL,
  `publisher` int(4) NOT NULL,
  `genreid` int(3) NOT NULL,
  `publishyear` char(4) NOT NULL,
  `pagecount` int(4) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `amazonlink` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN13`, `title`, `publisher`, `genreid`, `publishyear`, `pagecount`, `description`, `amazonlink`) VALUES
('9780062390622', 'The Alchemist', 1, 6, '1995', 224, 'Santiago, a young shepherd living in the hills of Andalucia, feels that there is more to life than his humble home and his flock. One day he finds the courage to follow his dreams into distant lands, each step galvanised by the knowledge that he is following the right path: his own. The people he meets along the way, the things he sees and the wisdom he learns are life-changing.\n\nWith Paulo Coelho’s visionary blend of spirituality, magical realism and folklore, The Alchemist is a story with the power to inspire nations and change people’s lives.', 'https://www.amazon.co.uk/Alchemist-Fable-About-Following-Dream/dp/0722532938/'),
('9780141439747', 'Oliver Twist', 2, 4, '1838', 608, 'The story of the orphan Oliver, who runs away from the workhouse only to be taken in by a den of thieves, shocked readers when it was first published.\n\nDickens\'s tale of childhood innocence beset by evil depicts the dark criminal underworld of a London peopled by vivid and memorable characters - the arch-villain Fagin, the artful Dodger, the menacing Bill Sikes and the prostitute Nancy.', 'https://www.amazon.co.uk/Oliver-Twist-Penguin-Clothbound-Classics/dp/0141192496/'),
('9780199539277', 'Twenty Thousand Leagues Under the Sea', 2, 4, '1870', 528, 'In this thrilling adventure tale by the \'Father of Science Fiction\', three men embark on an epic journey under the sea with the mysterious Captain Nemo aboard his submarine the Nautilus. Over the course of their fantastical voyage, they encounter the lost city of Atlantis, the South Pole and the corals of the Red Sea, and must battle countless adversaries both human and monstrous. Verne\'s triumphant work of the imagination shows the limitless possibilities of science and the dark depths of the human mind.', 'https://www.amazon.co.uk/Thousand-Leagues-Penguin-Clothbound-Classics/dp/0241198771/'),
('9780241425442', 'The Thursday Murder Club', 2, 2, '2021', 400, 'In a peaceful retirement village, four unlikely friends meet up once a week to investigate unsolved murders. But when a brutal killing takes place on their very doorstep, the Thursday Murder Club find themselves in the middle of their first live case. Elizabeth, Joyce, Ibrahim and Ron might be pushing eighty but they still have a few tricks up their sleeves.', 'https://www.amazon.co.uk/Thursday-Murder-Club-Record-Breaking-Bestseller/dp/0241988268/ref=zg_bs_books_sccl_40/260-8569927-2632648?psc=1'),
('9780553897845', 'A Game Of Thrones', 1, 3, '2011', 864, 'Kings and queens, knights and renegades, liars, lords and honest men… all will play the GAME OF THRONES.\n\nSummers span decades. Winter can last a lifetime. And the struggle for the Iron Throne has begun.\n\nIt will stretch from the south, where heat breeds plot, lusts and intrigues; to the vast and savage eastern lands; all the way to the frozen north, where a 700-foot wall of ice protects the kingdom from the dark forces that lie beyond. The Game of Thrones. You win, or you die.', 'https://www.amazon.co.uk/Song-Ice-Fire-Game-Thrones/dp/0007428545/'),
('9780679417392', 'Nineteen Eighty-Four', 2, 4, '1949', 328, 'Who controls the past controls the future: who controls the present controls the past\'\n\nHidden away in the Record Department of the sprawling Ministry of Truth, Winston Smith skilfully rewrites the past to suit the needs of the Party. Yet he inwardly rebels against the totalitarian world he lives in, which demands absolute obedience and controls him through the all-seeing telescreens and the watchful eye of Big Brother, symbolic head of the Party. In his longing for truth and liberty, Smith begins a secret love affair with a fellow-worker Julia, but soon discovers the true price of freedom is betrayal.', 'https://www.amazon.co.uk/Nineteen-Eighty-Four-Penguin-Clothbound-Classics/dp/0241453518/'),
('9780745343495', 'Augmented Exploitation: Artificial Intelligence Automation and Work', 6, 5, '2021', 192, 'Artificial Intelligence is a seemingly neutral technology, but it is increasingly used to manage workforces and make decisions to hire and fire employees. Its proliferation in the workplace gives the impression of a fairer, more efficient system of management. A machine can\'t discriminate, after all.\n\nAugmented Exploitation explores the reality of the impact of AI on workers\' lives. While the consensus is that AI is a completely new way of managing a workplace, the authors show that, on the contrary, AI is used as most technologies are used under capitalism: as a smokescreen that hides the deep exploitation of workers.', 'https://www.amazon.co.uk/Augmented-Exploitation-Artificial-Intelligence-Automation/dp/074534349X/'),
('9781250835765', 'Pulling the Wings Off Angels', 5, 3, '2022', 98, 'Long ago, a wealthy man stole an angel and hid her in a chapel, where she remains imprisoned to this day.\n\nThat’s the legend, anyway.\n\nA clerical student who’s racked up gambling debts to a local gangster is given an ultimatum—deliver the angel his grandfather kidnapped, or forfeit various body parts in payment.\n\nAnd so begins a whirlwind theological paradox—with the student at its center—in which the stakes are the necessity of God, the existence of destiny—and the nature of angels.', 'https://www.amazon.co.uk/Pulling-Wings-Off-Angels-Parker/dp/1250835763/'),
('9781398502857', 'Lives Like Mine', 4, 6, '2022', 384, 'Meet Monica, the flawed heroine at the heart of LIVES LIKE MINE.\n \nWith her three children in school, Monica finds herself wondering if this is all there is. Despite all the effort and the smiles, in the mirror she sees a woman hollowed out from putting everyone else first, tolerating her in-laws’ intolerance, and wondering if she has a right to complain when she’s living the life that she has created for herself.\n \nThen along comes Joe, a catalyst for change in the guise of a flirtatious parent on the school run. Though the sudden spark of their affair is hedonistic and oh so cathartic, Joe soon offers a friendship that shows Monica how to resurrect and honour the parts of her identity that she has long suppressed. He is able to do for Monica what Dan has never managed to, enabling her both to face up to a past of guilty secrets and family estrangements, and to redefine her future.', 'https://www.amazon.co.uk/exec/obidos/ASIN/1398502855'),
('9781712674215', 'A Christmas Carol', 2, 4, '1843', 106, 'A timeless holiday classic that has been enjoyed for generations. It tells the tale of Ebenezer Scrooge, a miserly old man who is visited by three ghosts on Christmas Eve. Through this spiritual journey, Scrooge learns to let go of his past and embrace the joys of the holiday season. This beloved story is sure to bring warmth and cheer to readers of all ages. With its timeless message of redemption and joy, A Christmas Carol is the perfect book to bring out the spirit of the holidays.', 'https://www.amazon.co.uk/Christmas-Carol-Charles-Dickens/dp/1712674218/'),
('9781787635098', 'This is the Night They Come For You', 2, 2, '2022', 406, 'On a stifling afternoon at Police HQ in Algiers, Superintendent Taleb, coasting towards retirement, with not even an air-conditioned office to show for his long years of service, is handed a ticking time bomb of a case which will take him deep into Algeria\'s troubled past and its fraught relationship with France.\n\nTo his dismay, he is assigned to work with Agent Hidouchi, an intimidating representative of the country\'s feared secret service, who makes it clear she intends to call the shots. They are instructed to pursue a former agent, now on the run after twenty years in prison for his part in a high-level corruption scandal. But their search will lead them inexorably towards a greater mystery, surrounding a murder that took place in Paris more than fifty years ago.\n\nUncovering the truth may be his responsibility, but Taleb is well aware that no-one in Algeria wants to be reminded of the dark deeds carried out in the struggle for independence - or in the violence that has racked the nation since. Before long, he will face a choice he has long sought to avoid, between self-preservation and doing the right thing.', 'https://www.amazon.co.uk/This-Night-They-Come-You-ebook/dp/B09G9DG7WD/ref=zg_bs_270410_sccl_14/260-8569927-2632648?psc=1#detailBullets_feature_div'),
('9781838853327', 'We Are Electric', 3, 7, '2023', 352, 'You may be familiar with the idea of our body\'s biome: the bacterial fauna that populate our gut and can so profoundly affect our health. In We Are Electric we cross into new scientific understanding: discovering your body\'s electrome.\n\nEvery cell in our bodies—bones, skin, nerves, muscle—has a voltage, like a tiny battery. It is the reason our brain can send signals to the rest of our body, how we develop in the womb, and why our body knows to heal itself from injury. When bioelectricity goes awry, illness, deformity, and cancer can result. But if we can control or correct this bioelectricity, the implications for our health are remarkable: an undo switch for cancer that could flip malignant cells back into healthy ones; the ability to regenerate cells, organs, even limbs; to slow aging and so much more. The next scientific frontier might be decrypting the bioelectric code, much the way we did the genetic code.\n\nYet the field is still emerging from two centuries of skepticism and entanglement with medical quackery, all stemming from an 18th-century scientific war about the nature of electricity between Luigi Galvani (father of bioelectricity, famous for shocking frogs) and Alessandro Volta (inventor of the battery).', 'https://www.amazon.com/gp/product/0306826623'),
('9781847941831', 'Atomic Habits', 2, 1, '2018', 320, 'People think that when you want to change your life, you need to think big. But world-renowned habits expert James Clear has discovered another way. He knows that real change comes from the compound effect of hundreds of small decisions: doing two push-ups a day, waking up five minutes early, or holding a single short phone call.\n\nHe calls them atomic habits.\n\nIn this ground-breaking book, Clears reveals exactly how these minuscule changes can grow into such life-altering outcomes. He uncovers a handful of simple life hacks (the forgotten art of Habit Stacking, the unexpected power of the Two Minute Rule, or the trick to entering the Goldilocks Zone), and delves into cutting-edge psychology and neuroscience to explain why they matter. Along the way, he tells inspiring stories of Olympic gold medalists, leading CEOs, and distinguished scientists who have used the science of tiny habits to stay productive, motivated, and happy.', 'https://www.amazon.co.uk/Atomic-Habits-Proven-Build-Break/dp/1847941834/ref=zg_bs_books_sccl_6/260-8569927-2632648?psc=1');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genrename` varchar(24) NOT NULL,
  `genreid` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genrename`, `genreid`) VALUES
('Self-improvement', 1),
('Crime & mystery', 2),
('Fantasy', 3),
('Classics', 4),
('Political', 5),
('General fiction', 6),
('Non-fiction', 7);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publishername` varchar(24) NOT NULL,
  `hqlocation` varchar(32) NOT NULL,
  `website` varchar(48) NOT NULL,
  `foundedyear` char(4) NOT NULL,
  `ceoname` varchar(24) NOT NULL,
  `ceostart` char(4) NOT NULL,
  `publisherID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publishername`, `hqlocation`, `website`, `foundedyear`, `ceoname`, `ceostart`, `publisherID`) VALUES
('Harper Collins', 'New York, United States', 'http://www.harpercollins.com/', '1817', 'Brian Murray', '2018', 1),
('Penguin Books', 'London, United Kingdom', 'https://www.penguin.co.uk/', '1935', 'Peter Field', '2006', 2),
('Hatchett Book Group', 'New York, United States', 'http://www.hachettebookgroup.com/', '2006', 'David Young', '2006', 3),
('Simon and Schuster', 'New York, United States', 'https://www.simonandschuster.co.uk/', '1924', 'Jonathan Karp', '2022', 4),
('Macmillan', 'New York, United States', 'https://us.macmillan.com/', '1843', 'Don Weisberg', '2021', 5),
('Pluto Books', 'London, United Kingdom', 'https://www.plutobooks.com/', '1969', 'Veruschka Selbach', '2017', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorOfBook`
--
ALTER TABLE `authorOfBook`
  ADD PRIMARY KEY (`authorOfBookID`),
  ADD KEY `book` (`bookID`),
  ADD KEY `author` (`authorID`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authorID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN13`),
  ADD KEY `publisher` (`publisher`),
  ADD KEY `genre` (`genreid`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreid`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorOfBook`
--
ALTER TABLE `authorOfBook`
  MODIFY `authorOfBookID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `authorID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genreid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorOfBook`
--
ALTER TABLE `authorOfBook`
  ADD CONSTRAINT `author` FOREIGN KEY (`authorID`) REFERENCES `authors` (`authorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book` FOREIGN KEY (`bookID`) REFERENCES `books` (`ISBN13`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `genre` FOREIGN KEY (`genreid`) REFERENCES `genre` (`genreid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publisher` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`publisherID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
