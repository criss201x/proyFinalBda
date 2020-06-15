const express = require('express');
const router = express.Router();
const pool = require('../database')
const { isLoggedIn } = require('../lib/auth')

/*router.get('/mostrar2', isLoggedIn, (req, res) => {
        res.render('consultas/mostrar2');
});*/

router.get('/', isLoggedIn, async (req, res) =>{//async es para consultas asinc 
        const consulta3 = await pool.query("SELECT id FROM Cita_Medica WHERE YEAR(fecha) = '2020' and MONTH(fecha)='03' and id_estado=(select id from Estado_Cita where nombre ='No asistio');")
        console.log("consulta 3")
        res.render('consultas3/mostrar3', { consulta3 });
});

module.exports = router;