window.l = -> console.log.apply console, &

requirejs.config do
  paths:
    'text': '../lib/require/text'
    'durandal':'../lib/durandal/js'
    'plugins' : '../lib/durandal/js/plugins'
    'transitions' : '../lib/durandal/js/transitions'
    'knockout': '../lib/knockout/knockout-3.1.0'
    'knockout-punches': '../lib/knockout/knockout.punches.min'
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

  ko = require 'knockout'
  require 'knockout-punches'
  ko.punches.interpolationMarkup.enable!
  ko.punches.attributeInterpolationMarkup.enable!

  app.title = 'ngANU'

  app.configurePlugins {
    +router
    +dialog
    +widget
    +observable
  }

  app.start().then ->
    viewLocator.useConvention!
    app.setRoot 'shell', void, 'app-host'