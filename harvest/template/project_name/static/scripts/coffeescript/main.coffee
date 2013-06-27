# The modules defined here are included in Cilantro. All project-level modules
# must be access via the namespaced path 'project/main'. This is to
# ensure modules of the same name do not conflict Cilantro's modules.

require ['cilantro.ui', 'project/csrf'], (c) ->

    c.router.register [
        id: 'workspace'
        route: 'workspace/'
        navigable: true
        view: new c.ui.EmptyView
            className: 'text-center'
            message: 'Workspace Coming Soon'
    ,
        id: 'query'
        route: 'query/'
        navigable: true
        view: new c.ui.QueryWorkflow
    ,
        id: 'results'
        route: 'results/'
        navigable: true
        view: new c.ui.ResultsWorkflow
    ]

    c.Backbone.history.start
        pushState: true
        root: c.getOption('routes.root')
