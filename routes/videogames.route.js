const router = require("express").Router();

const c = require("../controller/videogames.controller");

router.get("/:id", c.get);
router.get("/", c.all);
router.post("/", c.add);
router.delete("/:id", c.del);

router.get("/:id/users", c.users);

//
/* router.get("/", c.all);
router.get("/:id", c.get);
router.get("/:id/users", c.getusers); //cambiar la f

router.post("/", c.add);
router.put("/:id", c.put);
router.delete("/:id", c.del); */

module.exports = router;
