const passport = require('passport');

const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers');


passport.use('local.signin', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {
    console.log(req.body);
    const rows = await pool.query('select *from usuarios where username = ?', [username]);
    if (rows.length > 0) {
        const user = rows[0];
        const validPassword = await helpers.matchPassword(password, user.password);//esta linea valida el password unicamente de usuarios registrados por medio de aplicacion        
        if (password === user.password) {
            done(null, user, req.flash('success', 'bienvenido ' + user.username));            
        } else {
            done(null, false, req.flash('message', 'contraseña incorrecta'));
        }
    } else {
        return done(null, false, req.flash('message', 'el nombre de usuario no existe '));
    }
    /*console.log(req.body);
    console.log(username);
    console.log(password);*/
}));



passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {

    const { tipo } = req.body;
    const newUser = {
        username,
        password,
        tipo
    };
    //newUser.password = await helpers.encryptPassword(password);
    console.log(newUser);
    const result = await pool.query('insert into usuarios set ?', [newUser]);
    newUser.id = result.insertId;
    //console.log(result);
    return done(null, newUser);
}));


passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('select *from usuarios where id = ?', [id]);
    return done(null, rows[0]);
});

