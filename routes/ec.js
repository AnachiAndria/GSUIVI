const express = require('express');
const router = express.Router()
const db = require('../db');

//get all EC
router.get('/',(req,res)=>{
    const sql = 'SELECT * FROM `cahiertexte`';
    db.query(sql,(err, result) =>{
        if(err)throw err;
        res.json(result)
    });
});

//insert a ec

//update a ec

//delete a ec
module.exports = router;