const express = require('express');
const router = express.Router();
const pool = require('../modules/pool');
const {rejectUnauthenticated} = require('../modules/authentication-middleware');
//route set up to take data sent and 
//perform a query to the DB to return a specific park
router.post('/', rejectUnauthenticated, (req, res) => {
console.log('our req.body is', req.body.id)
  const queryText = `SELECT * FROM "state_park" where id = $1`;
  pool.query(queryText, [req.body.id])
      .then( (result) => {
        console.log(result.rows[0]);
        res.send(result.rows[0]);
      })
      .catch((error) => {
          console.log('we have an error ', error);
          res.sendStatus(500);
      });
});
module.exports = router;