const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();

app.use(cors());

const db = mysql.createConnection({
  host: "mysql",
  user: "root",
  password: "root",
  database: "devopsdb"
});

db.connect((err) => {
  if (err) {
    console.log(err);
  } else {
    console.log("MySQL Connected");
  }
});

app.get("/", (req, res) => {
  res.send("Backend API Running");
});

app.listen(5000, () => {
  console.log("Server running on port 5000");
});