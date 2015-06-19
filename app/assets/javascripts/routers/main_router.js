ggDimSum.Routers.MainRouter = Backbone.Router.extend({

  routes: {
    '': 'homePage',
    'createMenuItem': 'createMenuItem',
    'menu/:tag': 'showMenuItemsWithThisTag'
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  homePage: function () {
    var homePageView = new ggDimSum.Views.HomePage({
      collection: ggDimSum.Collections.allTags
    });
    this._swapView(homePageView);
  },

  createMenuItem: function () {
    var createMenuItemView = new ggDimSum.Views.MenuItem();
    this._swapView(createMenuItemView);
  },

  showMenuItemsWithThisTag: function (tag) {
    var collection = new ggDimSum.Collections.MenuItems({ tag: tag });
    // fetch the updated collection of tags
    // pass it to the view that will handle the display of this tag
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }
});
