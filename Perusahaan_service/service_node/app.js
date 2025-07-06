// app.js
const express = require('express');
const mysql = require('mysql2');
const app = express();
app.use(express.json());

const db = mysql.createConnection({
  host: 'db',
  user: 'root',
  password: 'rootpass',
  database: 'perusahaan'
});

// GET all products
app.get('/produk', (req, res) => {
  db.query('SELECT * FROM produk', (err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
});

// POST new product
app.post('/produk', (req, res) => {
  const { nama_produk, harga, stok } = req.body;
  db.query('INSERT INTO produk (nama_produk, harga, stok) VALUES (?, ?, ?)', [nama_produk, harga, stok], (err, result) => {
    if (err) return res.status(500).send(err);
    res.json({ message: 'Produk ditambahkan', id: result.insertId });
  });
});

// PUT update product
app.put('/produk/:id', (req, res) => {
  const { nama_produk, harga, stok } = req.body;
  db.query('UPDATE produk SET nama_produk=?, harga=?, stok=? WHERE id=?', [nama_produk, harga, stok, req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.json({ message: 'Produk diperbarui' });
  });
});

// DELETE product
app.delete('/produk/:id', (req, res) => {
  db.query('DELETE FROM produk WHERE id=?', [req.params.id], (err) => {
    if (err) return res.status(500).send(err);
    res.json({ message: 'Produk dihapus' });
  });
});

app.listen(3000, () => console.log('Service produk (Node.js) listening on port 3000'));
