const express = require('express');
const router = express.Router();
const db = require('../db');

// Get all professors
router.get('/', (req, res) => {
    const sql = 'SELECT * FROM `prof`';
    db.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
    });
});

// Insert a professor
router.post('/add', (req, res) => {
    const { nomProf, prenomProf, situation } = req.body;
    const sql = 'INSERT INTO `prof` (nomProf, prenomProf, situation) VALUES (?, ?, ?)';
    db.query(sql, [nomProf, prenomProf, situation], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to add professor' });
        } else {
            res.status(201).json({ message: 'Professor added successfully', insertedId: result.insertId });
        }
    });
});

// Update a professor
router.put('/update/:idProf', (req, res) => {
    const { idProf } = req.params;
    const { nomProf, prenomProf, situation } = req.body;
    const sql = 'UPDATE `prof` SET nomProf = ?, prenomProf = ?, situation = ? WHERE idProf = ?';
    db.query(sql, [nomProf, prenomProf, situation, idProf], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to update professor' });
        } else {
            res.json({ message: 'Professor updated successfully' });
        }
    });
});

// Delete a professor
router.delete('/delete/:idProf', (req, res) => {
    const { idProf } = req.params;
    const sql = 'DELETE FROM `prof` WHERE idProf = ?';
    db.query(sql, [idProf], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to delete professor' });
        } else {
            res.json({ message: 'Professor deleted successfully' });
        }
    });
});

module.exports = router;
