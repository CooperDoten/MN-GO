const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/', (req, res) => {
    //get all of a users trips based on id
  console.log(`in our user trips GET`, req.user.id);
  let queryText = `SELECT * FROM "user_trip" WHERE "user_id" = $1 ORDER BY "id" DESC;`;
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
