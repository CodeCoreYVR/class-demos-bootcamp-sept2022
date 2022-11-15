const express = require('express');
const router = express.Router();
const {index} = require('../controllers/home');

// 🌳 R O O T  P A T H
router.get('/', index);

module.exports = router;
