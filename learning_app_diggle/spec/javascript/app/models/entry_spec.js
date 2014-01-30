describe("LearningAppDiggle.App.Models.Entry", function () {
  var entry;

  beforeEach(function () {
    entry = new LearningAppDiggle.App.Models.Entry(LearningAppDiggle.fixtures.entry());
  });

  describe("save", function () {
    it("posts to /entry", function () {
      entry.save();

      expect(mostRecentAjaxRequest().url).toBe('/entries');
      expect(mostRecentAjaxRequest().method).toBe('POST');
    });
  });
});