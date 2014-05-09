window._D = -> console.log.apply console, &

requirejs.config do
  paths:
    'text': '../lib/require/text'
    'durandal':'../lib/durandal/js'
    'plugins' : '../lib/durandal/js/plugins'
    'transitions' : '../lib/durandal/js/transitions'
    'knockout': '../lib/knockout/knockout-3.1.0'

    'bootstrap': '../lib/avant/js/bootstrap.min'
    'jquery': '../lib/avant/js/jquery-1.10.2.min'

  shim:
    'bootstrap':
      deps: ['jquery']
      exports: 'jQuery'


define (require) ->
  system = require 'durandal/system'
  app = require 'durandal/app'
  viewLocator = require 'durandal/viewLocator'

  system.debug true

  app.title = 'ngANU'

  app.configurePlugins {
    +router
    +dialog
    +widget
    +observable
  }

  app.start().then ->
    viewLocator.useConvention!
    app.setRoot 'shell', 'entrance', 'app-host'