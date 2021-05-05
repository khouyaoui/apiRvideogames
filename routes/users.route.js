const router = require("express").Router();

const c = require("../controller/users.controller");

router.get("/", c.all);
router.get("/:id", c.get);
router.delete("/:id", c.del);
router.post("/", c.add);
router.put("/:id", c.put);

router.get("/:id/videogames",c.videogames);

module.exports = router;
