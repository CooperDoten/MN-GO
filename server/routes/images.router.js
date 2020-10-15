const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

/**
 * GET route template
 */
router.post('/', (req, res) => {
   console.log(`in our images router.post`, req.body.id);
  let queryText = `	SELECT "state_park_images"."photo" FROM "state_park_images"
  JOIN "state_park"
   ON "state_park"."id" = "state_park_images"."state_park_id"
  WHERE "state_park"."id" = $1;`;
  pool.query(queryText, [req.body.id])
  .then(result => {
      console.log(result.rows);
      res.send(result.rows);
  }).catch(err => {
      console.log(`got an error in Parks GET`, err);
      res.sendStatus(500);
  })
});


module.exports = router;