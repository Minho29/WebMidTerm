var HTTP_PORT = 5500;
var express = require("express");
var app = express();
var db = require("./data.js");
var md5 = require("md5");
var cookieParser = require("cookie-parser");
app.use(cookieParser());
const cors = require("cors");
app.use(
  cors({
    origin: "*",
  })
);
app.use(express.json());
const multer = require("multer");
app.use(multer().none());
const path = require("path");
var bodyParser = require("body-parser");
const { CLIENT_RENEG_LIMIT } = require("tls");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, "../public")));

app.listen(HTTP_PORT, () => {
  console.log("Server running on port %PORT%".replace("%PORT%", HTTP_PORT));
});

app.get("/api/announcements", (_, res, next) => {
  var sql = "select * from announcements";
  var params = [];
  db.all(sql, params, (err, rows) => {
    if (err) {
      res.status(400).json({ error: err.message });
      return;
    }
    res.json({
      message: "success",
      data: rows,
    });
  });
});

app.post("/api/register", (req, res, next) => {
  res.set({
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
  });
  var errors = [];
  let pass = req.body.password;
  if (pass === undefined) {
    errors.push("No password specified");
  }
  if (errors.length) {
    res.status(400).json({ error: errors.join(",") });
    return;
  }
  var data = {
    name: req.body.name,
    password: req.body.password,
  };
  var sql = "INSERT INTO users (name, pass) VALUES (?,?)";
  var params = [data.name, data.password];
  db.run(sql, params, function (err, result) {
    if (err) {
      res.status(400).json({ error: err.message });
      return;
    }
    res.send(true);
  });
});

app.post("/api/login", async function (req, res) {
  res.type("text");
  let name = req.body.name;
  let password = req.body.password;
  if (name === undefined || password === undefined) {
    res.status(400).send("Missing required paramaters name or password.");
  } else {
    let sql = `SELECT * FROM users WHERE name = '${name}' AND pass = '${password}';`;
    db.all(sql, (err, rows) => {
      if (err) {
        res.status(400).json({ error: err.message });
        return;
      }
      if (rows.length === 0) {
        res.send("Incorect Name or Password!");
        return;
      }
      let name = rows[0]["name"];
      res.cookie("name", name, { expires: new Date(Date.now() + 90000000) });
      res.send(true);
    });
  }
});

app.get("/api/all/courses", (req, res, next) => {
  res.set({
    "Content-Type": "application/json",
  });
  if (req.cookies.name) {
    var sql =
      "select * from courses where id not in (select course_id from myCourses where user_id = (select id from users where name = ?))";
  } else {
    var sql = "select * from courses";
  }
  var params = req.cookies.name;
  db.all(sql, params, (err, rows) => {
    if (err) {
      res.status(400).json({ error: err.message });
      return;
    }
    res.json({
      message: "success",
      data: rows,
    });
  });
});

app.get("/api/my/courses", (req, res, next) => {
  if (req.cookies.name) {
    let sql =
      "select * from courses where id in (select course_id from myCourses inner join users on myCourses.user_id = users.id where name = ?);";
    db.all(sql, [req.cookies.name], (err, rows) => {
      if (err) {
        res.status(400).json({ error: err.message });
      }
      res.json({
        messages: "success",
        data: rows,
      });
    });
  } else {
    res.json({
      messages: "please login first!",
      data: [],
    });
  }
});

app.post("/api/my/courses", async (req, res, next) => {
  if (req.cookies.name) {
    var sqlname = "SELECT * FROM users WHERE name = ? ";
    db.all(sqlname, req.cookies.name, (err, result) => {
      if (err) {
        res.status(400).json({ error: err.message });
        return;
      }
      let id = result[0]["id"];
      let courseid = req.body.courseID;
      var data = {
        user_id: id,
        courseid: courseid,
        status: "Learning",
      };
      var sql =
        "INSERT INTO myCourses (user_id,course_id,status) VALUES (?,?,?)";
      var params = [data.user_id, data.courseid, data.status];
      db.run(sql, params, function (err, result) {
        if (err) {
          res.status(400).json({ error: err.message });
          return;
        }
        res.json({
          message: "success",
        });
      });
    });
  } else {
    res.status(400).json({ error: "Please login first!" });
  }
});

app.get("/api/course/:courseid/quizes", (req, res, next) => {
  if (req.cookies.name) {
    let courseId = req.params.courseid;
    let sql = "select * from quizes where course_id = ?;";
    db.all(sql, courseId, (err, rows) => {
      if (err) {
        res.status(400).json({ error: err.message });
        return;
      }
      if (rows.length === 0) {
        res.send("Quiz is empty!");
        return;
      }
      res.json({
        message: "success",
        data: rows,
      });
    });
  } else {
    res.send("please login first!");
  }
});

app.get("/api/course/:courseid/doquiz/:quizid", (req, res, next) => {
  if (req.cookies.name) {
    let quizId = req.params.quizid;
    let sql =
      "select * from questions  INNER JOIN (select * from Question_answer INNER JOIN answers on answers.id = Question_answer.answerID) as Question  on questions.id = Question.questionID where quiz_id = ?";
    db.all(sql, quizId, (err, rows) => {
      if (err) {
        res.status(400).json({ error: err.message });
        return;
      }
      const groupBy = (items, key) => items.reduce(
        (result, item) => ({
          ...result,
          [item[key]]: [
            ...(result[item[key]] || []),
            item,
          ],
        }), 
        {},
      );

      res.json({
        message: "success",
        data: Object.entries(groupBy(rows, "content")),
      });
    });
  } else {
    res.send("please login first!");
  }
});

app.post("/api/course/:courseid/doquiz/:quizid", (req, res, next) => {
  if (req.cookies.name) {
    let answer = req.body.answer;
    let data = ""
    let length = answer.length;
    for (let i = 0; i < length; i++) {
      console.log(answer[i]);
      data += answer[i]
    }
    data = JSON.parse(data)
    length = data.length
    let sql = "SELECT * FROM questions";
    db.all(sql, (err, rows) => {
      if (err) {
        res.status(400).json({ error: err.message });
        return;
      }
      let score = 0;
      console.log(data[0]);
      for (let i = 0; i < rows.length; i++) {
        for (let j = 0; j < data.length; j++) {
          if (rows[i]["id"] == Object.values(data[j])[0]) {
            if (rows[i]["answer_id"] == Object.values(data[j])[1]) {
              score++;
            }
          }
        }
      }
      res.json({
        message: "success",
        data: [score, length],
      });
    });
  } else {
    res.send("please login first!");
  }
});

app.use(function (req, res) {
  res.status(404);
});
