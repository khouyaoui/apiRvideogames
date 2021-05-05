const { connection: conn } = require("../database/connection");

function all(req, res, next) {
  console.log("all users");
  conn.query(`SELECT * FROM users`, (error, results, fields) => {
    if (error) return next(error);
    if (results.length === 0) return next({ error: `users not found` });
    return res.json(results);
  });
}

module.exports = { all };
