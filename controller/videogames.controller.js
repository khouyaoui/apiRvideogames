const {connection: conn} = require("../database/connection");
require("dotenv").config();

async function all(req, res, next) {
    const [rows, fields] = await conn.promise().query(`SELECT *
                                                       FROM videogames`);
    if (rows.length === 0)
        return next({status: 404, error: `videogames not found`});
    for (let j = 0; j < rows.length; j++) {
        rows[j].self = "http://localhost:" + process.env.PORT + "/api/videogames/" + rows[j].id;
    }
    return res.json(rows);
}

async function get(req, res, next) {
    let id = req.params.id;
    const [
        rows,
        fields,
    ] = await conn.promise().query(`SELECT *
                                    FROM videogames
                                    WHERE id = ?`, [id]);
    if (rows.length === 0)
        return next({status: 404, error: `videogames not found`});
    rows[0].self = "http://localhost:" + process.env.PORT + "/api/videogames/" + id;
    return res.json(rows);
}

async function add(req, res, next) {
    try {
        const [rows, fields] = await conn
            .promise()
            .query(`INSERT INTO videogames
                    values (id, '${req.body.name}');`)
        return res.json(rows);

    } catch (ex) {
        return next(ex);
    }
}

/*
async function load(req, res, next) {
    try {
        //const [rows, fields] = await conn.promise().query(`DELETE FROM videogames`);
        const [rows, fields] = await conn
            .promise()
            .query(`TRUNCATE TABLE videogames`);
    } catch (ex) {
        return next(ex);
    }

    const videojuegos = require("../mock").games;

    // await videojuegos
    //     .map(elem => ({ id: elem.id + 1, name: elem.nombre }))
    //     .forEach(async (v) => {
    //         try {
    //             const [rows, fields] = await conn.promise()
    //                 .query(`INSERT INTO videogames SET ?`, v);
    //         }
    //         catch (ex) {
    //             console.log(ex)
    //         }
    //     })

    // await videojuegos
    //     .forEach(async (elem) => {
    //         try {
    //             const v = {}
    //             if (elem.id) v.id = elem.id + 1
    //             v.name = elem.nombre
    //             const [rows, fields] = await conn.promise()
    //                 .query(`INSERT INTO videogames SET ?`, v);
    //         }
    //         catch (ex) {
    //             console.log(ex)
    //         }
    //     })

    // for (let i = 0; i < videojuegos.length; i++) {
    //     elem = videojuegos[i]
    //     try {
    //         const v = {}
    //         if (elem.id) v.id = elem.id + 1
    //         v.name = elem.nombre
    //         const [rows, fields] = await conn.promise()
    //             .query(`INSERT INTO videogames SET ?`, v);
    //     }
    //     catch (ex) {
    //         console.log(ex)
    //     }
    // }

    // console.time("map")
    // const videojuegosm = videojuegos.map(elem => {
    //     const v = {}
    //     if (elem.id) v.id = elem.id + 1
    //     v.name = elem.nombre
    //     return v
    // })
    // for (const elem of videojuegosm) {
    //     try {
    //         const [rows, fields] = await conn.promise()
    //             .query(`INSERT INTO videogames SET ?`, elem);
    //     }
    //     catch (ex) {
    //         console.log(ex)
    //     }
    // }
    // console.timeEnd("map")

    console.time("for");
    for (const elem of videojuegos) {
        try {
            const v = {};
            if (elem.id) v.id = elem.id + 1;
            v.name = elem.nombre;
            const [rows, fields] = await conn
                .promise()
                .query(`INSERT INTO videogames
                        SET ?`, v);
        } catch (ex) {
            console.log(ex);
        }
    }
    console.timeEnd("for");

    res.json({message: `${videojuegos.length} videogames loaded`});
}
*/
async function del(req, res, next) {
    try {
        const [rows, field] = await conn
            .promise()
            .query("DELETE FROM videogames WHERE id = ?", req.params.id);

        return res.json(rows);
    } catch (ex) {
        return next(ex);
    }
}

async function users(req, res, next) {
    const [users] = await conn
        .promise()
        .query(`SELECT users.id, users.login, users.name
                FROM users
                         join scores as s
                where s.videogame = ${req.params.id}
                  and s.user = id;`);
    if (users.length === 0)
        return next({status: 404, error: `users not found`});

    for (let j = 0; j < users.length; j++) {
        users[j].self = "http://localhost:" + process.env.PORT + "/api/users/" + users[j].id;
    }

    return res.json(users);
}

module.exports = {all, get, add, users, del};
