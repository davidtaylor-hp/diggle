describe("LearningAppDiggle.App.Models.Word", function () {
  var word;

  beforeEach(function () {
    word = new LearningAppDiggle.App.Models.Word(LearningAppDiggle.App.fixtures.word());
  });

  it("can be instantiated and its text can be accessed", function() {
    expect(definition.get("word")).toEqual("word");
  });
});