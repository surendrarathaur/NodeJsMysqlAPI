const { verify, decoded } = require('jsonwebtoken');

module.exports = {
    checkToken: (req,res, next) => {
        let token = req.get('Authorization');
        if(token){
            token = token.slice(7),
            verify(token, process.env.JWT_KEY, (err, decoded) => {
                if(err){
                    res.json({
                        success:0,
                        message:'Invalid token'
                    })
                }else{
                    console.log(decoded.result)
                    next();
                }
            });
        }else{
                res.json({
                    success:0,
                    message:"Access denied! unauthorized user"
                })
        }
    }
}

