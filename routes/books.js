const express = require("express");
const connection = require("../db");

// declare router
const router = express.Router();

router.get("/", async (req, res) => {
  try {
      const getBooks = await connection.query(
        `SELECT 
          b.idbooks, b.title, b.summary, b.image, CONCAT(a.firstname, ' ', a.lastname) AS author FROM books AS b JOIN author AS a ON a.idauthor = b.author_idauthor`
      )
      res.status(200).json(getBooks)
    }
    catch (error) {
      console.log(error)
      res.status(500)
    }
  });
  
  module.exports = router;

