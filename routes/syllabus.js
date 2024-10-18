const express = require('express');
const router = express.Router()
const db = require('../db');

//get all CT
router.get('/',(req,res)=>{
    const sql = 'SELECT * FROM `cahiertexte`';
    db.query(sql,(err, result) =>{
        if(err)throw err;
        res.json(result)
    });
});

// insert a syllabuss

//update a CT

//delete a CT

module.exports = router;