const express = require('express');
const knex = require('../db/client');

const router = express.Router()

router.get('/', (req, res) => {
  knex('todos')
    .orderBy("createdAt", "DESC")
    .then(todos => {
      res.render("todos/index", {list: todos})
    })
})

router.get('/new', (req, res) => {
  res.render('todos/new', {todo: false})
})

router.post('/', (req, res) => {
  knex('todos')
    .insert({
      title: req.body.title,
      imageUrl: req.body.imageUrl,
      content: req.body.content
    })
    .returning('*')
    .then(todos => {
      const todo = todos[0]
      res.redirect(`todos/${todo.id}`)
    })
})



router.get("/:id", (req, res) => {
  knex("todos")
    .where('id', req.params.id)
    .first()
    .then(todo => {
      if(!todo) {
        res.send("No todo found")
      } else {
        res.render("todos/show", {todo: todo})
      }
    })
})





module.exports = router