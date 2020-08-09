const UserRouter = require('express').Router();
const DB = require('../config/database');
const { genSaltSync, hashSync} = require('bcrypt');
const jwt = require('jsonwebtoken');
const { checkToken } = require('../auth/token_validation');

UserRouter.get('/', function(req, res){
    DB.query('SELECT * FROM users', function (error, results, fields) {
        if(error){
            console.log(error)
        }else{
            res.json(results);
        }
    });    
});

UserRouter.post('/add', function(req, res){
    console.log(req.body)
    const body = req.body;
    const salt = genSaltSync(10);
    body.password = hashSync(body.password, salt);    
    DB.query('insert into users(name, email, password, address, phone, mobile) values(?,?,?,?,?,?)',
    [
        body.name,
        body.email,
        body.password,
        body.address,
        body.phone,
        body.mobile
    ],
    (error, results, fields) => {
        if(error){
            return res.json(error);
        }else{
            //return res.json(results);
            // create a jwt token that is valid for 1 hour
            const token = jwt.sign({ result: results }, process.env.JWT_KEY, { expiresIn: '1h' });
            return res.json({
                "success":1,
                "userid":results[0].userid,
                "token":token
            });
        }
    });
});


UserRouter.get('/edit/:id', checkToken, function(req, res){
    const userId = req.params.id;
    DB.query('select * from users where userId = ?',
    [
        userId
    ],
    (error, results, fields) => {
        if(error){
            return res.json(error);
        }else{
            //console.log(results[0].userid)
            return res.json(results);
        }
    });
});

UserRouter.post('/update/:id', checkToken, function(req, res){
    const userId = req.params.id;
    console.log(req.body)
    const body = req.body;
    const salt = genSaltSync(10);
    body.password = hashSync(body.password, salt);
    DB.query('Update users SET name=?, email=?, password=?, address=?, phone=?, mobile=? where userId=?',
    [
        body.name,
        body.email,
        body.password,
        body.address,
        body.phone,
        body.mobile,
        userId
    ],
    (error, results, fields) => {
        if(error){
            return res.json(error);
        }else{
            return res.json(results);
        }
    });  
});

UserRouter.get('/delete/:id', checkToken, function(req, res){
    const userId = req.params.id;
    DB.query('delete from users where userId = ?',
    [
        userId
    ],
    (error, results, fields) => {
        if(error){
            return res.json(error);
        }else{
            return res.json(results);
        }
    });
});

module.exports = UserRouter;