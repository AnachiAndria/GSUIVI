const express = require('express');
const router = express.Router()
const db = require('../db');

//get all parcours
router.get('/',(req,res)=>{
    const sql = 'SELECT * FROM `cahiertexte`';
    db.query(sql,(err, result) =>{
        if(err)throw err;
        res.json(result)
    });
});

//insert in parcours

//update a parcours

//delete a parcours

module.exports = router;