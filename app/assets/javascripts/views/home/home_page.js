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
    this._addAllMenuItemsSection();
    this._addOtherMenuItemsSection();
  },

  // top section#all-menu-items
  _addAllMenuItemsSection: function () {
    var allMenuItemsView = new ggDimSum.Views.MenuItems({
      collection: this.collection,
      template: "all"
    });
    this.addSubview('#all-menu-items', allMenuItemsView);
  },

  _addOtherMenuItemsSection: function () {
    var otherMenuItemsView = new ggDimSum.Views.MenuItems({
      collection: this.collection,
      template: false
    });
    this.addSubview('#other-menu-items', otherMenuItemsView);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();

    return this;
  }

});
