describe("LearningAppDiggle.App.Views.Diggle", function() {
  var view;
  beforeEach(function() {
    $html = $('<div><form class="new_entry"><span id="parent"><input id="entry_word" value="word"></span></form></div>');
    view = new LearningAppDiggle.App.Views.Diggle({el: $html});
  });

  describe("submitting the search", function() {
    var event;
    beforeEach(function() {
      event = jQuery.Event('submit');
      spyOn(event, 'preventDefault').andCallThrough();
    });

    it("creates a new entry", function() {
      view.$('.new_entry').trigger(event);

      expect(view.entry instanceof LearningAppDiggle.App.Models.Entry).toBeTruthy();
      expect(view.entry.get('word')).toEqual('word');
    });
  });
});