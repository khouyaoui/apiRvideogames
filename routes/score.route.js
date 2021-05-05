const router = require("express").Router();

const sc = require("../controller/score.controller");

router.get('/puntua/:id_user/:id_videogame/:score', sc.puntua);

router.get('/', sc.scores);

router.put('/', sc.inScores);


module.exports = router;
