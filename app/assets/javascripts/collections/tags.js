ggDimSum.Collections.Tags = Backbone.Collection.extend({
  url: 'api/tags',
  model: ggDimSum.Models.Tag

  
});

ggDimSum.Collections.allTags = new ggDimSum.Collections.Tags();
