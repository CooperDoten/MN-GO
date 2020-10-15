const express = require('express');
const router = express.Router();
const pool = require('../modules/pool');
const {
    rejectUnauthenticated,
  } = require('../modules/authentication-middleware');
//route set up to take data sent and 
//perform a query to the DB to return a specific movie
router.post('/', rejectUnauthenticated, (req, res) => {
console.log('our req.body is', req.body)
  const queryText = `UPDATE "user" SET "first_name" = $1, "last_name"= $2, "email" = $3,
  "street_address" = $4, "city" = $5, "zip_code" = $6
 WHERE "id" = $7 RETURNING "id";`;
  pool.query(queryText, [req.body.firstName, req.body.lastName, req.body.email,
  req.body.streetAddress, req.body.city, req.body.zipCode, req.body.userId])
    .then( (result) => {
      console.log(result.rows[0].id);
      const userId = result.rows[0].id;
      const userTripQuery = `INSERT INTO "user_trip" ("user_id", "state_park_id", "camp_site", "start_date", "end_date")
      VALUES($1, $2, $3, $4, $5);`;
      pool.query(userTripQuery, [userId, req.body.stateParkId, req.body.campSite, req.body.startDate, req.body.endDate])
    .then(result => {
      res.sendStatus(201);
    }).catch(err => {
      console.log('error in second catch', err);
      res.sendStatus(500);
    })
    }).catch(err => {
      console.log(`first query catch`, err);
      res.sendStatus(500);
    })
       
      
     
});
module.exports = router;