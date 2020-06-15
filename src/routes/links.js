const express = require('express');
const router = express.Router();

const pool = require('../database')
const { isLoggedIn } = require('../lib/auth')

router.get('/add', isLoggedIn, (req, res) => {
        res.render('links/add');
});

router.post('/add', isLoggedIn, async (req, res) =>{
        const { id, nombre, apellido, id_especialidad, direccion, id_municipio, id_tipo_id} = req.body;
        const newmedico = {
                id,
                nombre,
                apellido, 
                id_especialidad,
                direccion,
                id_municipio,
                id_tipo_id
        };
        //console.log(newmedico);
        await pool.query('insert into medico set ?', [newmedico]);

        req.flash('success', 'agregado correctamente');
        res.redirect('/links');//con el '/' devuelve a la pagina de inicio 
});

router.get('/', isLoggedIn, async (req, res) =>{//async es para consultas asinc
        const links = await pool.query('select *from medico limit 10')
        console.log(links);        
        res.render('links/list', { links });
});

router.get('/delete/:id', isLoggedIn, async (req, res) =>{//async es para consultas asinc
        //const links = await pool.query('select *from medico')
        const { id } = req.params;
        await pool.query('delete from medico where id = ?', [id]);
        req.flash('success', 'eliminado correctamente');
        res.redirect('/links');//con el '/' devuelve a la pagina de inicio 
});

router.get('/edit/:id', isLoggedIn, async (req, res) =>{//async es para consultas asinc        
        const { id } = req.params;
        const links = await pool.query('select *from medico where id = ?', [id]);
        //console.log(id);        
        //res.send('recibido'); 
        //console.log(links);                
        res.render('links/edit', {link: links[0]});
        //res.redirect('/links');//con el '/' devuelve a la pagina de inicio 
});

router.post('/edit/:id', isLoggedIn, async (req, res) =>{//async es para consultas asinc        
        const { id } = req.params;
        const { nombre, apellido, id_especialidad, direccion, id_municipio, id_tipo_id } = req.body;
        const newlink = {
                id,
                nombre,
                apellido, 
                id_especialidad,
                direccion,
                id_municipio,
                id_tipo_id
        };
        //console.log(newlink);        
        //res.send('actualizado');         
        await pool.query('update medico set ? where id = ?', [newlink, id]);
        req.flash('success', 'editado correctamente');
        res.redirect('/links');//con el '/' devuelve a la pagina de inicio 
});

module.exports = router;