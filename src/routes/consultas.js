const express = require('express');
const router = express.Router();
const pool = require('../database')
const { isLoggedIn } = require('../lib/auth')

/*router.get('/mostrar', isLoggedIn, (req, res) => {
        res.render('consultas/mostrar');
});*/

router.get('/', isLoggedIn, async (req, res) =>{//async es para consultas asinc        
        const consulta1 = await pool.query("SELECT id_hospitalizacion FROM Cita_Hospitalizacion  where id_cita_medica in(select id FROM Cita_Medica where id_paciente in( SELECT id FROM Paciente WHERE id_Estado=( SELECT id FROM Estado_Paciente WHERE nombre ='No Afiliado'))) limit 15")
        console.log("consulta 1")
        res.render('consultas/mostrar', { consulta1 });
});

module.exports = router;