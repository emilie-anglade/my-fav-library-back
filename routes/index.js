// const thingsRoutes = require('./things');
const books = require('./books')


module.exports = (app) => {

  // use forms route for url http://${DB_HOST}:${DB_PORT}/api/forms
  app.use("/api/books", books)
}
