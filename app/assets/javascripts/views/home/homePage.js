ggDimSum.Views.HomePage = Backbone.CompositeView.extend({
  template: JST['home/homepage'],

  initialize: function () {
    this.addNavbar();
  },

  addNavbar: function () {
    var navbarView = new ggDimSum.Views.LayoutsNavbar();
    this.addSubview('#navbar', navbarView);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();

    return this;
  }

});
