LearningAppDiggle.Views.Diggle = Backbone.View.extend({
  events: {
    "submit .new_entry": "searchForEntry"
  },

  initialize: function() {
    this.$entryInput = this.$("#entry_word");
  },

  searchForEntry: function(event) {
    var e = $.event.fix(event);
    e.preventDefault();
    this.entry = new LearningApp.Models.Entry({
      word: this.$entryInput.val()
    });

    this.entry.on('change:definitionList', this._renderDefinitions, this);
    this.entry.on('error', this._displayError, this);

    this.entry.save();
  },

  _renderDefinitions: function() {
    this.$entryInput.parent().removeClass('error');
    this.definitionListView = new LearningApp.Views.DefinitionListView({el: '.definitions', collection: this.entry.definitionList}).render();
  },
});