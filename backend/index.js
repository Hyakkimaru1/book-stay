const express = require('express');
const app = express();
const cookePaser = require('cookie-parser');
var cors = require('cors');

app.use(cookePaser());
app.use(cors());
app.use(cors({ credentials: true, origin: true }));

app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));

app.use(express.static('public'));

require('./middlewares/routes.mdw')(app);

app.listen(process.env.PORT || 3300);