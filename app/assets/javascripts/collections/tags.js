ggDimSum.Collections.Tags = Backbone.Collection.extend({
  model: ggDimSum.Models.Tag,
  url: '/api/tags'

});

ggDimSum.Collections.allTags = new ggDimSum.Collections.Tags();
