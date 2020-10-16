const express = require('express');
const router = express.Router();
const pool = require('../modules/pool');
const {rejectUnauthenticated} = require('../modules/authentication-middleware');

router.put('/:id', rejectUnauthenticated, (req, res) => {
  
  console.log('our req.body is', req.body)
  //update user_trip_comment with new comment sent from tripData component
  const queryText = `UPDATE "user_trip" SET "comments" = $1 WHERE "id" = $2;`;
  pool.query(queryText, [req.body.comment, req.body.tripId])
      .then( (result) => {
     //Houston, we have success
        res.sendStatus(200);
      })
      .catch((error) => {
          console.log('we have an error ', error);
          res.sendStatus(500);
      });
});
module.exports = router;