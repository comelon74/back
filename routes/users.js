var express = require('express');
var router = express.Router();
var conn = require('./conexionBD');

/* GET users listing. */
router.get('/otracosa', function(req, res, next) {
  //conn.connect();
  conn.query('select * from users', function (error, results, fields) {
    if (error) throw error;
    res.status(200).json(results);
  });
  //conn.end();
});

module.exports = router;
