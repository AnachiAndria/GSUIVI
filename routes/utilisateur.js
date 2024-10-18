const express = require('express');
const router = express.Router();
const db = require('../db'); // Connexion à la base de données
const crypto = require('crypto'); // Pour générer des tokens

//get all user
router.get('/',(req,res)=>{
    const sql = 'SELECT * FROM utilisateur ';
    db.query(sql,(err, result) =>{
        if(err)throw err;
        res.json(result)
    });
});

// Fonction pour générer un token aléatoire de 10 caractères
function generateToken() {
    return crypto.randomBytes(5).toString('hex'); // 10 caractères hexadécimaux (chiffres et lettres)
}

// Route pour créer un utilisateur
router.post('/add', (req, res) => {
    const { nom, prenom, mail, mdp, role } = req.body;

    // Validation des données reçues
    if (!nom || !prenom || !mail || !mdp || !role) {
        return res.status(400).json({ error: 'Veuillez remplir tous les champs requis.' });
    }

    // Génération du token utilisateur
    const userToken = generateToken();

    // Insertion dans la base de données
    const sql = `INSERT INTO utilisateur (nom, prenom, mail, mdp, role, userToken) VALUES (?, ?, ?, ?, ?, ?)`;
    db.query(sql, [nom, prenom, mail, mdp, role, userToken], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: 'Erreur lors de la création de l\'utilisateur.' });
        }

        res.status(201).json({ message: 'Utilisateur créé avec succès', userId: result.insertId, userToken });
    });
});
// Update a utilisateur
router.put('/update/:IdUser', (req, res) => {
    const { IdUser } = req.params;
    const { nom, prenom, mail, role, mdp } = req.body;
    const sql = 'UPDATE `utilisateur` SET nom = ?, prenom = ?, mail = ?, role = ?, mdp = ? WHERE IdUser = ?';
    db.query(sql, [nom, prenom, mail, role, mdp, IdUser], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to update utilisateur' });
        } else {
            res.json({ message: 'utilisateur updated successfully' });
        }
    });
});

// Delete a utilisateur
router.delete('/delete/:IdUser', (req, res) => {
    const { IdUser } = req.params;
    const sql = 'DELETE FROM `utilisateur` WHERE IdUser = ?';
    db.query(sql, [IdUser], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Failed to delete utilisateur' });
        } else {
            res.json({ message: 'utilisateur deleted successfully' });
        }
    });
});


module.exports = router;
