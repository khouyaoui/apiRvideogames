const {connection: conn} = require("../database/connection");

async function scores(req, res, next) {
    const [rows, fields] = await conn.promise().query(`SELECT *
                                                       FROM scores`);
    if (rows.length === 0)
        return next({status: 404, error: `scores not found`});
    //return res.json(rows.map(({ id, name }) => ({ id, name })));
    return res.json(rows);
}

// insert or update using url params
async function puntua(req, res, next) {
    const user_id = req.params.id_user;
    const videogame_id = req.params.id_videogame;
    const score = req.params.score;

    const obj = {
        user: user_id,
        videogame: videogame_id,
        score: score,
    };

    try {
        const [
            rows,
            fields,
        ] = await conn
            .promise()
            .query(`INSERT INTO scores
                    SET ?
                    ON DUPLICATE KEY UPDATE score=?`, [
                obj,
                obj.score,
            ]);
        return res.json(rows);
    } catch (ex) {
        return next(ex);
    }
}

// insert or update using body data
async function inScores(req, res, next) {
    const user_id = req.body.user;
    const videogame_id = req.body.videogame;
    const score = req.body.score;

    const obj = {
        user: user_id,
        videogame: videogame_id,
        score: score,
    };

    try {
        const [
            rows,
            fields,
        ] = await conn
            .promise()
            .query(`INSERT INTO scores
                    SET ?
                    ON DUPLICATE KEY UPDATE score=?`, [
                obj,
                obj.score,
            ]);
        return res.json(rows);
    } catch (ex) {
        return next(ex);
    }

}


module.exports = {puntua, scores, inScores};
