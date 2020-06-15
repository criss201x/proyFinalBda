const express = require('express');
const router = express.Router();

const pool = require('../database')
const { isLoggedIn } = require('../lib/auth')

router.get('/add', isLoggedIn, (req, res) => {
        res.render('pacientes/add');
});

router.post('/add', isLoggedIn, async (req, res) =>{
        const { id, nombre, apellido, fecha_nto, direccion, id_municipio, id_tipo_id, id_estado} = req.body;
        const newpaciente = {
                id,
                nombre,
                apellido, 
                fecha_nto,
                direccion,
                id_municipio,
                id_tipo_id,
                id_estado
        };
        //console.log(newpaciente);
        await pool.query('insert into paciente set ?', [newpaciente]);

        req.flash('success', 'agregado correctamente');
        res.redirect('/pacientes');//con el '/' devuelve a la pagina de inicio 
});

router.get('/', isLoggedIn, async (req, res) =>{//async es para consultas asinc
        const pacientes = await pool.query('select *from paciente limit 10')
       // console.log(pacientes);        
        res.render('pacientes/list', { pacientes });
});

router.get('/delete/:id', isLoggedIn, async (req, res) =>{//async es para consultas asinc
        //const pacientes = await pool.query('select *from paciente')
        const { id } = req.params;
        await pool.query('delete from paciente where id = ?', [id]);
        req.flash('success', 'eliminado correctamente');
        res.redirect('/pacientes');//con el '/' devuelve a la pagina de inicio 
});

router.get('/edit/:id', isLoggedIn, async (req, res) =>{//async es para consultas asinc        
        const { id } = req.params;
        const pacientes = await pool.query('select *from paciente where id = ?', [id]);
        //console.log(id);        
        //res.send('recibido'); 
        //console.log(pacientes);                
        res.render('pacientes/edit', {pacientee: pacientes[0]});
        //res.redirect('/pacientes');//con el '/' devuelve a la pagina de inicio 
});

router.post('/edit/:id', isLoggedIn, async (req, res) =>{//async es para consultas asinc        
        const { id } = req.params;
        const { nombre, apellido, fecha_nto, direccion, id_municipio, id_tipo_id, id_estado } = req.body;
        const newlink = {
                id,
                nombre,
                apellido, 
                fecha_nto,
                direccion,
                id_municipio,
                id_tipo_id,
                id_estado
        };
        //console.log(newlink);        
        //res.send('actualizado');         
        await pool.query('update paciente set ? where id = ?', [newlink, id]);
        req.flash('success', 'editado correctamente');
        res.redirect('/pacientes');//con el '/' devuelve a la pagina de inicio 
});

module.exports = router;