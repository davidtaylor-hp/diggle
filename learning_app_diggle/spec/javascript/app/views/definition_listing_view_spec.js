describe("LearningAppDiggle.App.Views.DefinitionListingView", function () {
  var definitions, view;
  beforeEach(function() {
    definitions = [{text: 'test definition is real'}, {text: 'test definition is real too'}];

    var array_of_definitions = new LearningAppDiggle.App.Collections.ListingDefinition();
    array_of_definitions.add(definitions);

    view = new LearningAppDiggle.App.Views.DefinitionListingView({collection: array_of_definitions});
  });

  describe("render", function() {
    it("displays the definitions correctly", function() {
      var $html = $('<div>hi</div>');
      var the_view = jasmine.createSpyObj('defViewSpy', ['render']);
      spyOn(LearningAppDiggle.App.Views, 'DefinitionView').andReturn(the_view);
      the_view.render.andReturn({$el: $html});

      view.render();

      expect(LearningAppDiggle.App.Views.DefinitionView).toHaveBeenCalledWith({model: jasmine.any(LearningAppDiggle.App.Models.Definition)});
      expect(LearningAppDiggle.App.Views.DefinitionView.callCount).toEqual(2);

      expect(view.$('div:contains(apple)')).not.toBeEmpty();
    });
  });
});

describe("LearningAppDiggle.App.Views.DefinitionView", function() {
  var single_definition, view;

  beforeEach(function() {
    single_definition = new LearningAppDiggle.App.Models.Definition({text: "apple"});
    view = new LearningApp.Views.DefinitionView({model: single_definition});
  });

  describe("render", function() {
    it("displays the definition", function() {
      expect(view.render().$el).toHaveText('apple');
    });
  });
});