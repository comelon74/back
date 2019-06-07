var express = require('express');
var router = express.Router();
var conn = require('./conexionBD');

router.post('/mostrar', function(req, res, next) {
    correo=req.body.us_correo;
    contraseña=req.body.us_passwd;

    //conn.connect();
    conn.query('select * from w_usuarios where us_correo="'+correo+'" and us_passwd="'+contraseña+'";', function (error, results, fields) {
      if (error) {
        res.status(422).json([]);
      }else{
        res.status(200).json(results);
      }    
    });
    //conn.end();
  });

module.exports = router;