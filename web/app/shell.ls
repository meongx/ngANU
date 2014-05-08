define (require), ->
  context =
    router: require 'plugins/router'

    activate: ->
      context.router.map do
        * route: ''
          title: 'Server Status'
          moduleId: 'service/control'
          nav: true

        * route: 'test'
          title: 'Meong'
          moduleId: 'test/meong'
          nav: true

      context.router.activate!