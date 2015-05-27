ggDimSum.Views.MenuItems = Backbone.CompositeView.extend({
  allMenuItemsTemplate: JST['menu_item/all_menu_items'],
  tagsTemplate: JST['menu_item/other_menu_items'],

  initialize: function (options) {
    this.collection = options.foodTags;
    this.type = options.template;
  },

  events: {
    'click section': 'showMenuItemsWithThisTag'
  },

  // grab the tag-data, then trigger a navigate
  // router will handle the subsequent view change
  showMenuItemsWithThisTag: function (event) {
    var $tag = event.currentTarget.data("-tag");
    Backbone.history.navigate("#/category/" + $tag, { trigger: true });
  },

  render: function () {
    var templateView = this.type == "all" ? this.allMenuItemsTemplate : this.tagsTemplate;
    var renderedContent = templateView();
    this.$el.html(renderedContent);

    return this;
  }

});
