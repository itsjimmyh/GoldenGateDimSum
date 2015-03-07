window.ggDimSum = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    new ggDimSum.Routers.MainRouter ({
      $rootEl: $('#content')
    });

    Backbone.history.start();
  }
};
