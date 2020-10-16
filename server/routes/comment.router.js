const express = require('express');
const router = express.Router();
const pool = require('../modules/pool');
const {
    rejectUnauthenticated,
  } = require('../modules/authentication-middleware');
//route set up to take data sent and 
//perform a query to the DB to return a specific movie
router.put('/:id', rejectUnauthenticated, (req, res) => {
console.log('our req.body is', req.body)
  const queryText = `UPDATE "user_trip" SET "comments" = $1 WHERE "id" = $2;`;
  pool.query(queryText, [req.body.comment, req.body.tripId])
      .then( (result) => {
        console.log(result.rows);
        res.send(result.rows);
      })
      .catch((error) => {
          console.log('we have an error ', error);
          res.sendStatus(500);
      });
});
module.exports = router;