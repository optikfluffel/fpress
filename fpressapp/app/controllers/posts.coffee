Spine    = require('spine')
Main = require('controllers/posts.main')
Post = require('models/post')

class Posts extends Spine.Controller
  className: 'posts'
  
  constructor: ->
    super
    
    @main = new Main
    
    @routes
      '/posts/:id': (params) ->
        @main.show.active(params)
      '/posts': ->
        @main.show_all.active()
    
    @append @main

module.exports = Posts