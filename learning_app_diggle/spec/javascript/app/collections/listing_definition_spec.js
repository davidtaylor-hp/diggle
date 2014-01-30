describe("LearningAppDiggle.App.Collections.ListingDefinitions", function () {
  var definitions;
  beforeEach(function () {
    definitions = new LearningAppDiggle.App.Collections.ListingDefinitions(LearningAppDiggle.fixtures.definitionListings(2));
  });

  it("can be instantiated with an array of json", function() {
    expect(definitions.size()).toEqual(2);
  });
});