var express = require('express');
var router = express.Router();
var conn = require('./conexionBD');

/* GET users listing. */
router.get('/mostrar', function(req, res, next) {
  //conn.connect();
  conn.query('select * from users', function (error, results, fields) {
    if (error) {
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }

    
  });
  //conn.end();
});
/*router.get('/mostrar1', function(req, res, next) {
  //conn.connect();
  conn.query('select * from users where user_id="'+id+'"', function (error, results, fields) {
    if (error) {
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }

    
  });
  //conn.end();
});*/

router.post('/insertar', function(req, res, next) {
  //conn.connect();
  fname=req.body.first_name;
  lname=req.body.last_name;
  user=req.body.user;
  password=req.body.password;
  conn.query('insert into users (first_name,last_name,user,password) VALUES (" '+fname+' " , "'+lname+'","'+user+'","'+password+'");', function (error, results, fields) {
    if (error){
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }
  });
  //conn.end();
});

/*router.put('/modificar', function(req, res, next) {
  //conn.connect();
  fname=req.body.first_name;
  lname=req.body.last_name;
  user=req.body.user;
  password=req.body.password;
  conn.query('update into users (first_name,last_name,user,password) VALUES (" '+fname+' " , "'+lname+'","'+user+'","'+password+'");', function (error, results, fields) {
    if (error){
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }
    
  });
  //conn.end();
});*/
/*router.delete('/eliminar', function(req, res, next) {
  //conn.connect();
  user=req.body.user;
  conn.query('delete from users where user="'+user+'";', function (error, results, fields) {
    if (error){
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }
    
  });
  //conn.end();
});*/

module.exports = router;
