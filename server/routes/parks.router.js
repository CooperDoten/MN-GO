const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/', (req, res) => {
    //get all our state parks
   console.log(`in our parks router.get`);
  queryText = `SELECT * FROM "state_park" ORDER BY "id" ASC;`;
  pool.query(queryText)
  .then(response => {
      res.send(response.rows);
  }).catch(err => {
      console.log(`got an error in Parks GET`, err);
      res.sendStatus(500);
  })
});


module.exports = router;
