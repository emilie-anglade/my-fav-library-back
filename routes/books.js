const express = require("express");
const connection = require("../db");

// declare router
const router = express.Router();

router.get("/", async (req, res) => {
  try {
      const getBooks = await connection.query(
        `SELECT 
          *
          FROM books`
      )
      console.log(getBooks)
      res.status(200).json(getBooks)
    }
    catch (error) {
      console.log(error)
      res.status(500)
    }
  });
  
  module.exports = router;