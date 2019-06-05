var express = require('express');
var router = express.Router();
var conn = require('./conexionBD');

/* GET users listing. */
router.get('/mostrar', function(req, res, next) {
    //conn.connect();
    conn.query('SELECT * FROM c_citas', function (error, results, fields) {
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
    conn.query('select * from c_citas where ci_id="'+output+'"', function (error, results, fields) {
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
    paciente=req.body.ci_paciente;
    doctor=req.body.ci_doctor;
    consultorio=req.body.ci_consultorio;

    conn.query('insert into c_citas (ci_paciente,ci_doctor,ci_consultorio) VALUES ("'+paciente+'","'+doctor+'","'+consultorio+'");', function (error, results, fields) {
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
    conn.query('delete from c_citas where ci_id="'+output+'";', function (error, results, fields) {
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
    id=req.body.ci_id
    paciente=req.body.ci_paciente;
    doctor=req.body.ci_doctor;
    consultorio=req.body.ci_consultorio;
    conn.query('UPDATE `c_citas` SET `ci_paciente`='+paciente+',`ci_doctor`='+doctor+',`ci_consultorio`='+consultorio+' WHERE `ci_id`='+id+';', function (error, results, fields) {
      if (error){
        res.status(422).json([]);
      }else{
        res.status(200).json(results);
      }
      
    });
    //conn.end();
  });

module.exports = router;