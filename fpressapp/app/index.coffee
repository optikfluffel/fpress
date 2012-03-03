require('lib/setup')

Spine = require('spine')
Posts = require('controllers/posts')
Post = require('models/post')

class App extends Spine.Controller
  constructor: ->
    super
    
    @log('saving test models')
    p1 = new Post(title: "1 title", text: "1", id: 1)
    p1.save()
    p2 = new Post(title: "2 title", text: "2", id: 2)
    p2.save()
    @log('saved test models')
    
    @log("App up and running :)") 
    
    @posts = new Posts
    
    #defining starting point of application
    @routes
      '/': ->
        @posts.main.show_all.active()
    
    Spine.Route.setup()
    
    
    @append @posts.active()

module.exports = App
