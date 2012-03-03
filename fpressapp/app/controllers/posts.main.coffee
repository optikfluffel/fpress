Post = require('models/post')
Spine    = require('spine')

class Show extends Spine.Controller
  className: 'show'
    
  constructor: ->
    super
    @active @load
  
  load: (params) =>
    @item = Post.find(params.id)
    @html require('views/post')(@item)

class Show_all extends Spine.Controller
  className: 'show_all'
  
  events:
    "click .items" : "click"
  
  constructor: ->
    super
    @active @load
  
  load: =>
    @item = Post.all()
    @html require('views/posts')(@item)
  
  change: (postId) =>
    @navigate("/posts", postId)
  
  click: (event) ->
    @change(event.target.id)
    
class Main extends Spine.Stack
  className: 'main stack'
  controllers:
    show: Show
    show_all : Show_all

module.exports = Main