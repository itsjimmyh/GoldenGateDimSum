ggDimSum.Models.Tag = Backbone.Model.extend({
  urlRoot: '/api/tags',

  menuItems: function () {
    if(!this._menuItems) {
      this._menuItems = new ggDimSum.Collections.Tags([], { tag: this })
    }
    return this._menuItems;
  },

  parse: function (response) {
    if (response.menuItems) {
      this.menuItems().set(response.menuItems, { parse: true });
      delete response.menuItems;
    }

    return response;
  }
});
