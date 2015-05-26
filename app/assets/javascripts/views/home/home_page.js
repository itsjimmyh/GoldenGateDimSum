ggDimSum.Views.HomePage = Backbone.CompositeView.extend({
  template: JST['home/homepage'],

  initialize: function () {
    this.addNavbar();
    this.setUpPageContentWithFoodChoices();
  },

  addNavbar: function () {
    var navbarView = new ggDimSum.Views.LayoutsNavbar();
    this.addSubview('#navbar', navbarView);
  },

  // one function that collects all other functions to set up homePageView
  setUpPageContentWithFoodChoices: function () {
    this._addAllMenuItemsChoices();
  },

  // top section#all-menu-items
  _addAllMenuItemsChoices: function () {
    var allMenuItemsView = new ggDimSum.Views.MenuItems({
      collection: ggDimSum.Collections.allTags,
      template: "all"
    });
    this.addSubview('#all-menu-items', allMenuItemsView);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();

    return this;
  }

});
