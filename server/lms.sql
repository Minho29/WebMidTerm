create table users (
    id integer primary key AUTOINCREMENT,
    name text UNIQUE,
    pass text
);
INSERT INTO users (id, name, pass)
VALUES (1, 'user1', '123456');

create table announcements (
    id INTEGER primary key,
    content text
);
INSERT INTO announcements (id, content)
VALUES 
(1, 'Announcement of the HANU Foreign Language Proficiency Test, the output standard for students in the English language major, university level, distance learning form, courses 29 and 30.'),
(2, 'Exam schedule, list and instructions for computer-based NLNN exam for general English teachers at all levels, exam on December 3, 2022'),
(3, 'Admission results; Guide to university admission in the form of studying while working, 2nd batch in 2022');

create table courses(
    id integer primary key,
    name text,
    img_url text,
    discription text
);
INSERT INTO courses 
VALUES
(1, 'Data structures and Algorithms', './assets/image/ctdlvgt.jpg', 'This course will help you understand algorithms as well as understand the nature of data structures - a condition to become a good programmer.'),
(2, 'Java Basic', './assets/image/javabasic.jpg', 'Basic Java programming course for beginners, this course will be the foundation for an advanced Java course to progress to Java Web or Android programming, ...'),
(3, 'Python Basic', './assets/image/pythonbasic.jpg', 'Basic Python programming course with easy-to-understand exercises and theory, you can confidently move on to more advanced Python topics.'),
(4, 'JavaOOP', './assets/image/javaoop.jpg', 'Object-Oriented-Programming is an object-based programming method to find the essence of the problem. Java OOP course helps programmers learn programming techniques that all logic, ...');


create table myCourses(
    id integer primary key AUTOINCREMENT,
    user_id integer,
    course_id integer,
    status text,
    foreign key (user_id) references user(id),
    foreign key (course_id) references courses(course_id)
);
INSERT into myCourses
VALUES
(1, 1, 1, 'Done'),
(2, 1, 2, 'Learning');

create table quizes(
    id integer primary key,
    course_id integer,
    name text,
    foreign key (course_id) references courses(course_id)
);
INSERT INTO quizes(id, course_id, name)
VALUES
(1, 1, 'Mid-term'),
(2, 1, 'Final-test'),
(3, 2, 'Mid-term'),
(4, 2, 'Final-test'),
(5, 3, 'Mid-term'),
(6, 3, 'Final-test'),
(7, 4, 'Mid-term'),
(8, 4, 'Final-test');

create table answers(
    id integer primary key,
    content text
);
INSERT INTO answers 
VALUES
(1, 'array'),(2, 'tree'),(3, 'queue'),(4, 'stack'),
(5, 'Array'),(6, 'Case'),(7, 'Switch'),(8, 'Loop'),
(9, 'Stack'),(10, 'Binary Tree'),(11, 'Queue'),(12, 'Double linked list'),
(13, 'nums[8]'),(14, 'nums(4)'),(15, 'nums[3]'),(16, 'nums(3)'),
(17, 'Arrays'),(18, 'Stacks'),(19, 'Tables'),(20, 'Trees'),
(21, 'Arrays'),(22, 'Abstract Data Types'),(23, 'Variables'),(24, 'Algorithms'),
(25, 'Linear Queue'),(26, 'Priority Queue'),(27, 'Circular Queue'),(28, 'Double Ended Queue'),
(29, 'Variable'),(30, 'Pointer'),(31, 'Link List'),(32, 'Trees'),
(33, 'List of Outputs'),(34, 'First in Last Out'),(35, 'Last in First Out'),(36, 'None of them'),
(37, 'Popping'),(38, 'Pushing'),(39, 'Polling'),(40, 'None'),
(41, 'System.Out.Print("Java!");'),(42, 'System.out.Print("Java!");'),(43, 'System.Out.print("Java!");'),(44, 'System.out.print("Java!");'),
(45, 'boolean'),(46, 'double'),(47, 'char'),(48, 'long'),
(49, 'boolean'),(50, 'double'),(51, 'char'),(52, 'long'),
(53, 'byte'),(54, 'long'),(55, 'int'),(56, 'short'),
(57, 'next()'),(58, 'print()'),(59, 'nextLine()'),(60, 'println()'),
(61, 'test'),(62, 'Both are equally acceptable'),(63, 'Test'),(64, 'Neither are acceptable'),
(65, 'Processor, Main Memory, Secondary Memory and I/O'),(66, 'Processor, RAM, ROM and the bus'),(67, 'Processor, RAM, I/O and Windows'),(68, 'Processor, hard drive, VGA port and USB'),
(69, 'class1'),(70, 'HappyDays'),(71, '2legit2quit'),(72, 'Whats_up_with_that'),
(73, '//comment'),(74, '\\comment'),(75, '\comment'),(76, '==comment'),
(77, 'webcam'),(78, 'monitor'),(79, 'printer'),(80, 'speakers'),
(81, 'print()'),(82, 'screen()'),(83, 'Print()'),(84, 'write()'),
(85, 'print(Hello World!)'),(86, 'print("Hello World" + !)'),(87, 'print("Hello World!")'),(88, 'print"(Hello World!)"'),
(89, '11'),(90, 'Syntax Error'),(91, 'x*y'),(92, '30'),
(93, '11'),(94, 'Syntax Error'),(95, 'x*y'),(96, '30'),
(97, 'We have six cakes'),(98, 'We have 6 cakes'),(99, 'We havesix cakes'),(100, 'Syntax Error'),
(101, 'value of age is 15
value of newAge is 35
output is: your age in 20 years is: 35'),(102, 'value of age is 15
value of newAge is "age + 20"
output is: your age in 20 years is: 35'),(103, 'value of age is 15
value of newAge is 20
output is: your age in 20 years is: 20'),(104, 'value of age is 15
value of newAge is 35
output is: your age in 20 years is:35'),
(105, '/, *, +, -'),(106, '\, x, +, -'),(107, 'div, mul, +, -'),(108, '~, *, +, -'),
(109, 'List'),(110, 'String'),(111, 'Tuple'),(112, 'Numeric'),
(113, 'Tuple'),(114, 'String'),(115, 'List'),(116, 'Numeric'),
(117, '100'),(118, '505'),(119, '5050'),(120, '2500'),
(121, 'DecimalFormat( )'),(122, 'java.util.Scanner;'),(123, 'javax.swing.JOptionPane;'),(124, 'java.util.Random'),
(125, 'another name for an instance variable'),(126, 'the return type of a method'),(127, 'the instantiation of an object'),(128, 'the method that creates an object, or instance, of the class'),
(129, '148'),(130, '147'),(131, '156'),(132, 'none of these'),
(133, 'it modifies or mutates an object'),(134, 'it is private'),(135, 'it applies to the entire class, not just one object or instance'),(136, 'it is overloaded'),
(137, '3'),(138, '83'),(139, '8'),(140, '300'),
(141, 'Students s = new Student()'),(142, 'GradStudent g = new Student()'),(143, 'Student s = new GradStudents()'),(144, 'GradStudent g = new GradStudent()'),
(145, 'a method'),(146, 'a class'),(147, 'an algorithm'),(148, 'an interface'),
(149, 'void'),(150, 'concatenation'),(151, 'static'),(152, 'string'),
(153, 'reference'),(154, 'modulous'),(155, 'instance'),(156, 'void'),
(157, 'int myArray [] = {1, 3, 5};'),(158, 'int myArray [] [] = {1,2,3,4};'),(159, 'int [] myArray = (5, 4, 3);'),(160, 'int [] myArray = {“1”, “2”, “3”};');

create table questions(
    id integer primary key,
    content text,
    quiz_id integer,
    answer_id integer,
    foreign key (answer_id) references answers(answer_id),
    foreign key (quiz_id) references quizes(quiz_id)
);
INSERT INTO questions 
VALUES
(1, 'Example of linear data structure except', 1, 2),
(2, '_________________ is a collection of elements used to store the same type of data.', 1, 5),
(3, 'Which of these data structures is LIFO?', 1, 9),
(4, 'int nums[ ] = {2, 3, 5, 8, 9, 11};
How would you access the fourth element in nums', 1, 15),
(5, 'Which of the following is NOT a Type of Data Structures?', 1, 19),
(6, 'Storage for data defined in terms of set of operations to be performed on the data', 2, 22),
(7, 'A FIFO structure implemented as a ring where the front and rear pointers can wrap around the end of the start of the array', 12, 27),
(8, 'It use pointer to link nodes.', 2, 31),
(9, 'LIFO stands for', 2, 35),
(10, 'Act of adding values into a stack is called', 2, 38),
(11, 'Which is the correct Java code to display the phrase "Java!"?', 3, 44),
(12, 'Which primitive type is for integers?', 3, 48),
(13, 'Which primitive type is for floating point decimals?', 3, 50),
(14, 'Which accepts the smallest range of values?', 3, 53),
(15, 'Which puts the cursor on the next line after printing a String?', 3, 60),
(16, 'Which is the conventional way to name a class in Java?', 4, 63),
(17, 'What are the 4 basic components of a computer system?', 4, 65),
(18, 'Which identifier is not legal in java?', 4, 71),
(19, 'What does a comment look like in Java?', 4, 73),
(20, 'What is a good example of an input device?', 4, 77),
(21, 'To display something on the screen, use this command:', 5, 81),
(22, 'To display the following on screen "Hello World!" the following command should be used:', 5, 87),
(23, 'x = 5
y = 6
print(x*y)', 5, 92),
(24, 'x = 5
y = 6
print("x*y")', 5, 95),
(25, 'cakeAmount = raw_input()
print "We have", cakeAmount, " cakes"
.The above code is run. You type:
six', 5, 97),
(26, 'age = input("Enter Age (as integer): ")
newAge = age + 20
print ("your age in 20 years is:", newAge)
you enter:
15', 6, 101),
(27, 'Operators used in python:
divide, multiply, add, subtract', 6, 105),
(28, 'What is the data type of ["Sunday","Monday","Tuesday"]', 6, 109),
(29, 'What is the data type of {"India","UAE","USA"} ?', 6, 113),
(30, 'What will be the answer of print("50" + "50")', 6, 119),
(31, 'What java library must be imported to get user input for the Scanner class?', 7, 122),
(32, 'What is a constructor?', 7, 128),
(33, 'What is 1001 0011 in decimal?', 7, 130),
(34, 'What does it mean when a method is static?', 7, 135),
(35, 'What is the result of the following expression when x is 3583?
(x/10)%10', 7, 139),
(36, 'GradStudent extends class Student.  Which of these is NOT valid?', 8, 143),
(37, 'A precise step-by-step procedure that solves a problem or a achieves a goal is ....', 8, 147),
(38, '_________________ means the method has no return value.', 8, 149),
(39, '___________________ variable is a variable defined in a class.', 8, 155),
(40, 'Which of the below is valid way to instantiate an array in java?', 8, 157);

CREATE TABLE Question_answer (
	questionID	INTEGER,
	answerID	INTEGER,
	PRIMARY KEY(answerID AUTOINCREMENT),
	FOREIGN KEY(answerID) REFERENCES answers(id),
	FOREIGN KEY(questionID) REFERENCES questions(id)
);
INSERT INTO Question_answer 
VALUES
(1,1),(1,2),(1,3),(1,4),
(2,5),(2,6),(2,7),(2,8),
(3,9),(3,10),(3,11),(3,12),
(4,13),(4,14),(4,15),(4,16),
(5,17),(5,18),(5,19),(5,20),
(6,21),(6,22),(6,23),(6,24),
(7,25),(7,26),(7,27),(7,28),
(8,29),(8,30),(8,31),(8,32),
(9,33),(9,34),(9,35),(9,36),
(10,37),(10,38),(10,39),(10,40),
(11,41),(11,42),(11,43),(11,44),
(12,45),(12,46),(12,47),(12,48),
(13,49),(13,50),(13,51),(13,52),
(14,53),(14,54),(14,55),(14,56),
(15,57),(15,58),(15,59),(15,60),
(16,61),(16,62),(16,63),(16,64),
(17,65),(17,66),(17,67),(17,68),
(18,69),(18,70),(18,71),(18,72),
(19,73),(19,74),(19,75),(19,76),
(20,77),(20,78),(20,79),(20,80),
(21,81),(21,82),(21,83),(21,84),
(22,85),(22,86),(22,87),(22,88),
(23,89),(23,90),(23,91),(23,92),
(24,93),(24,94),(24,95),(24,96),
(25,97),(25,98),(25,99),(25,10),
(26,101),(26,102),(26,103),(26,104),
(27,105),(27,106),(27,107),(27,108),
(28,109),(28,110),(28,111),(28,112),
(29,113),(29,114),(29,115),(29,116),
(30,117),(30,118),(30,119),(30,120),
(31,121),(31,122),(31,123),(31,124),
(32,125),(32,126),(32,127),(32,128),
(33,129),(33,130),(33,131),(33,132),
(34,133),(34,134),(34,135),(34,136),
(35,137),(35,138),(35,139),(35,140),
(36,141),(36,142),(36,143),(36,144),
(37,145),(37,146),(37,147),(37,148),
(38,149),(38,150),(38,151),(38,152),
(39,153),(39,154),(39,155),(39,156),
(40,157),(40,158),(40,159),(40,160);
