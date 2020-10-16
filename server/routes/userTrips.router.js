const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

/**
 * GET route template
 */
router.get('/', (req, res) => {
  console.log(`in our user trips POST`, req.user.id);
  let queryText = `SELECT * FROM "user_trip" WHERE "user_id" = $1 ORDER BY "id" ASC;`;
  pool.query(queryText, [req.user.id])
  .then(result => {
      console.log(`our result is this`, result.rows)
      res.send(result.rows);
  }).catch(err => {
      console.log(`got an error in Parks GET`, err);
      res.sendStatus(500);
  })
});

module.exports = router;
