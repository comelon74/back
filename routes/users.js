var express = require('express');
var router = express.Router();
var conn = require('./conexionBD');

/* GET users listing. */
router.get('/mostrar', function(req, res, next) {
  //conn.connect();
  conn.query('SELECT p.pd_id, p.pa_nombre, p.pa_apellido_p, p.pa_apellido_m, p.pa_ocupacion, p.pa_estado_civil, p.pa_escolaridad, p.pa_alcohol, p.pa_drogas, p.pa_tabaco, o.oc_id, o.oc_nombre, e.ec_id, e.ec_nombre, s.es_id, s.es_nombre FROM a_pacientes AS p LEFT JOIN w_ocupacion AS o ON p.pa_ocupacion = o.oc_id LEFT JOIN z_estado_civil AS e ON e.ec_id = p.pa_estado_civil LEFT JOIN z_escolaridad AS s ON p.pa_escolaridad = s.es_id', function (error, results, fields) {
    if (error) {
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }    
  });
  //conn.end();
});
router.get('/mostrar1/:id', function(req, res, next) {
  //conn.connect();
  output=req.params.id;
  conn.query('SELECT p.pd_id, p.pa_nombre, p.pa_apellido_p, p.pa_apellido_m, p.pa_ocupacion, p.pa_estado_civil, p.pa_escolaridad, p.pa_alcohol, p.pa_drogas, p.pa_tabaco, o.oc_id, o.oc_nombre, e.ec_id, e.ec_nombre, s.es_id, s.es_nombre FROM a_pacientes AS p LEFT JOIN w_ocupacion AS o ON p.pa_ocupacion = o.oc_id LEFT JOIN z_estado_civil AS e ON e.ec_id = p.pa_estado_civil LEFT JOIN z_escolaridad AS s ON p.pa_escolaridad = s.es_id WHERE p.pd_id ='+output+'', function (error, results, fields) {
    if (error) {
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
      console.log(results);
    }

    
  });
  //conn.end();
});

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



router.post('/eliminar/:id', function(req, res, next) {
  //conn.connect();
  output=req.params.id;
  conn.query('delete from users where user="'+output+'";', function (error, results, fields) {
    if (error){
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }
    
  });
  //conn.end();
});
router.post('/actualizar', function(req, res, next) {
  //conn.connect();
  id=req.body.user_id;
  fname=req.body.first_name;
  lname=req.body.last_name;
  user=req.body.user;
  password=req.body.password;
  conn.query('UPDATE `users` SET `first_name`="'+fname+'",`last_name`="'+lname+'",`user`="'+user+'",`password`="'+password+'" WHERE `user_id`="'+id+'" ;', function (error, results, fields) {
    if (error){
      res.status(422).json([]);
    }else{
      res.status(200).json(results);
    }
    
  });
  //conn.end();
});

module.exports = router;
