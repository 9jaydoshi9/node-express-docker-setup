const express = require('express')
const app = express()
const port = 3001;

app.get('/', (req, res) => {
  res.send('A basic hello world for Docker setup with node.')
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
});