ggDimSum.Routers.MainRouter = Backbone.Router.extend({

  routes: {
    '': 'homePage',
    'createMenuItem': 'createMenuItem'
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  homePage: function () {
    var homePageView = new ggDimSum.Views.HomePage();
    this._swapView(homePageView);
  },

  createMenuItem: function () {
    var createMenuItemView = new gg.DimSum.Views.MenuItem();
    this._swapView(createMenuItemView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }
});
