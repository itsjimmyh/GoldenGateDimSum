ggDimSum.Views.LayoutsFlashMessage = Backbone.CompositeView.extend({
  // id: "flash-message",

  template: JST['layouts/flash_message'],

  initialize: function (options) {
    this.messages = options.messages;
    this.flashClass = options.flashClass;
  },

  render: function () {
    var renderedContent = this.template({
      messages: this.messages,
      flashClass: this.flashClass
    });
    // this.$el.html(renderedContent);
    this.$el = renderedContent;
    this.delegateEvents(this.events);

    return this;
  }
});
