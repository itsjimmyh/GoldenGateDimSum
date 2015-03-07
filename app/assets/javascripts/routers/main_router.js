ggDimSum.Routers.MainRouter = Backbone.Router.extend({

  routes: {
    '': 'homePage'
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  homePage: function () {
    var homePageView = new ggDimSum.Views.HomePage();
    this._swapView(homePageView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }
});
