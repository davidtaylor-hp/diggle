describe("LearningAppDiggle.App.Models.Definition", function () {
  var definition;

  beforeEach(function () {
    definition = new LearningAppDiggle.App.Models.Definition(LearningAppDiggle.fixtures.definition());
  });

  it("can be instantiated and its text can be accessed", function() {
    expect(definition.get("apple")).toEqual('a yummy fruit');
  });
});