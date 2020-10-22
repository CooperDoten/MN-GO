const express = require('express');
const router = express.Router();
const pool = require('../modules/pool');
const {rejectUnauthenticated} = require('../modules/authentication-middleware');

router.post('/', rejectUnauthenticated, (req, res) => {
  console.log('our req.body is', req.body)
  // update user table to include all the fields below
  const queryText = 
  `UPDATE "user" SET "first_name" = $1, "last_name"= $2, "email" = $3,
  "street_address" = $4, "city" = $5, "state" = $6, "zip_code" = $7 
  WHERE "id" = $8 RETURNING "id";`;
  pool.query(queryText, [req.body.firstName, req.body.lastName, req.body.email,
  req.body.streetAddress, req.body.city, req.body.state, req.body.zipCode, req.user.id])
    .then( (result) => {
      console.log(result.rows[0].id);
      const userId = result.rows[0].id; //get user id
      //add trip information from this and insert into user_trip table
      const userTripQuery = `INSERT INTO "user_trip" ("user_id", "state_park_id", "state_park_name", "camp_site", "photo", "start_date", "end_date")
      VALUES($1, $2, $3, $4, $5, $6, $7);`;
      pool.query(userTripQuery, [req.user.id, req.body.stateParkId, req.body.stateParkName, req.body.campSite, req.body.photo, req.body.startDate, req.body.endDate])
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