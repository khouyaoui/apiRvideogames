const { connection: conn } = require("../database/connection");

function all(req, res, next) {
  console.log("all users");
  conn
    .promise()
    .query(`SELECT * FROM users`)
    .then(([rows, fields]) => {
      if (rows.length === 0) return next({ error: `users not found` });
      return res.json(rows);
    })
    .catch((error) => {
      return next(error);
    });
}

module.exports = { all };
