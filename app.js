require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');

app.use(cors());
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());

const UserRouter = require('./router/UserRouter');
app.use('/user', UserRouter);

app.listen(process.env.APP_PORT, () => {
    console.log('Server up to running on port', process.env.APP_PORT);
});