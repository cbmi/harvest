// Generated by CoffeeScript 1.6.3
require(['cilantro.ui', 'project/csrf'], function(c) {
  c.router.register([
    {
      id: 'workspace',
      route: 'workspace/',
      navigable: true,
      view: new c.ui.EmptyView({
        className: 'text-center',
        message: 'Workspace Coming Soon'
      })
    }, {
      id: 'query',
      route: 'query/',
      navigable: true,
      view: new c.ui.QueryWorkflow
    }, {
      id: 'results',
      route: 'results/',
      navigable: true,
      view: new c.ui.ResultsWorkflow
    }
  ]);
  return c.Backbone.history.start({
    pushState: true,
    root: c.getOption('routes.root')
  });
});
