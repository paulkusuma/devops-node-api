const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('HELLO DevOps Version 2');
});

app.get('/health', (req, res) => {
  res.send('OK');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

