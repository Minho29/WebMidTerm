SELECT * FROM users

select * from myCourses;

DELETE FROM myCourses
WHERE id = 4;

select * from questions  INNER JOIN (select * from Question_answer INNER JOIN answers on answers.id = Question_answer.answerID) as Question  on questions.id = Question.questionID where quiz_id = 2;