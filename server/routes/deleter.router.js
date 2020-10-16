const express = require('express');
const router = express.Router();
const pool = require('../modules/pool');
const {
    rejectUnauthenticated,
  } = require('../modules/authentication-middleware');
//route set up to take data sent and 
//perform a query to the DB to return a specific movie
router.delete('/:id', rejectUnauthenticated, (req, res) => {
    //delete a specific user trip based on client delete in tripData.js
  console.log('made it to our delete router', req.params)
  const queryText = `DELETE FROM "user_trip" WHERE "id" = $1;`;
  pool.query(queryText, [req.params.id])
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