const express = require('express');
const router = express.Router();
const db = require('../db');

// Get all mention
router.get('/', (req, res) => {
    const sql = 'SELECT * FROM `mentions`';
    db.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
    });
});

// Insert a mention
router.post('/add', (req, res) => {
    const { nomMentions, description } = req.body;
    const sql = 'INSERT INTO `mentions` (nomMentions, description) VALUES (?, ?)';
    db.query(sql, [nomMentions, description], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to add mention' });
        } else {
            res.status(201).json({ message: 'Mention added successfully', insertedId: result.insertId });
        }
    });
});

// Update a Mention
router.put('/update/:IdMentions', (req, res) => {
    const { IdMentions } = req.params;
    const { nomMentions, description } = req.body;
    const sql = 'UPDATE `mentions` SET nomMentions = ?, description = ? WHERE IdMentions = ?';
    db.query(sql, [nomMentions, description, IdMentions], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to update Mention' });
        } else {
            res.json({ message: 'Mention updated successfully' });
        }
    });
});

// Delete a Mention
router.delete('/delete/:IdMentions', (req, res) => {
    const { IdMentions } = req.params;
    const sql = 'DELETE FROM `mentions` WHERE IdMentions = ?';
    db.query(sql, [IdMentions], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to delete Mention' });
        } else {
            res.json({ message: 'Mention deleted successfully' });
        }
    });
});

module.exports = router;
