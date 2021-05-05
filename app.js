require("dotenv").config();
const morgan = require('morgan');
const express = require("express");
const app = express();
const usersRoute = require("./routes/users.route");
const videogameRoute = require("./routes/videogames.route");
const scoreRoute = require("./routes/score.route");
app.use(morgan('dev'));
app.use(express.static("public"));

const port = process.env.PORT || 4000;


app.use(express.json());
app.use("/api/users", usersRoute);
app.use("/api/videogames", videogameRoute);
app.use("/api/scores", scoreRoute);

app.all("/api/*", (req, res, next) => {
    console.log(req.url);
    next({
        error: "Not found",
    });
});

app.use((err, req, res, next) => {
    res.json(err);
});

app.listen(port, () => {
});
