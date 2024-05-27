const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'your_password', // Ganti dengan password MySQL Anda
  database: 'transportation'
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL');
  }
});

app.get('/transportations', (req, res) => {
  db.query('SELECT * FROM transportation', (err, result) => {
    if (err) {
      res.status(500).send({ message: 'Error retrieving data from the database' });
    } else {
      res.status(200).send(result);
    }
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
