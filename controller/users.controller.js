const {connection: conn} = require("../database/connection");
require("dotenv").config();

async function all(req, res, next) {
    const [users] = await conn
        .promise()
        .query(`SELECT id, login, name
                FROM users`);
    if (users.length === 0)
        return next({status: 404, error: `users not found`});

    const [videogames] = await conn
        .promise()
        .query(
            `select *
             from scores
                      left join videogames on scores.videogame = videogames.id`
        );
    for (let j = 0; j < users.length; j++) {

        users[j].self = "http://localhost:" + process.env.PORT + "/api/users/" + users[j].id;

    }
    const result = users.map((e) => {
        e.videogames = videogames
            .filter((a) => a.user === e.id)
            .map(({user, videogame, ...agua}) => agua);
        //.map(({ id, name, score }) => ({ id, name, score }));
        return e;
    });

    return res.json(result);
}

async function get(req, res, next) {
    const id = req.params.id;
    console.log("get user", id);
    try {
        const [
            rows,
            fields,
        ] = await conn
            .promise()
            .query(`SELECT id, login, name
                    FROM users
                    WHERE id = ?`, [id]);
        if (rows.length === 0) return next({error: `user (${id}) not found`});
        rows[0].self = "http://localhost:4000/api/users/" + id;
        return res.json(rows[0]);
    } catch (ex) {
        return next(ex);
    }
}

async function add(req, res, next) {
    let obj = {
        login: req.body.login,
        password: req.body.password,
        name: req.body.name
    };

    try {
        const [result] = await conn
            .promise()
            .query("INSERT INTO users SET ?", obj);

        obj.id = result.insertId;
        delete obj.password;

        return res.json(obj);
    } catch (ex) {
        return next(ex);
    }
}

async function del(req, res, next) {
    try {
        const [rows, fields] = await conn
            .promise()
            .query("DELETE FROM users WHERE id = ?", req.params.id);

        return res.json(rows);
    } catch (ex) {
        return next(ex);
    }
}

async function put(req, res, next) {

    let obj = {
        login: req.body.login,
        password: req.body.password,
        name: req.body.name
    };

    try {
        const [result] = await conn
            .promise()
            .query(`update users
                    SET login    = '${req.body.login}',
                        password = '${req.body.password}',
                        name     = '${req.body.name}'
                    where id = ${req.params.id}`);

        obj.id = req.params.id;
        delete obj.password;
        return res.json(obj);
    } catch (ex) {
        return next(ex);
    }
}

async function videogames(req, res, next) {
    const [videogames] = await conn
        .promise()
        .query(`SELECT id,videogames.name
                FROM videogames
                         join scores as s
                where s.user = ${req.params.id} and s.videogame = id;`);
    if (videogames.length === 0)
        return next({status: 404, error: `videogames not found`});

    for (let j = 0; j < videogames.length; j++) {
        videogames[j].self = "http://localhost:" + process.env.PORT + "/api/videogames/" + videogames[j].id;
    }

    return res.json(videogames);
}

module.exports = {all, get, add, del, put, videogames};