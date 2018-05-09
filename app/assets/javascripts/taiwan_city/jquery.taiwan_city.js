$(document).on("turbolinks:load", function(){
  $.fn.taiwan_city = function() {
    return this.each(function() {
      var selects;
      selects = $(this).find('.city-select');
      return selects.change(function() {
        var $this, next_selects;
        $this = $(this);
        next_selects = selects.slice(selects.index(this) + 1);
        $("option:gt(0)", next_selects).remove();
        if (next_selects.first()[0] && $this.val()) {
          return $.get("/taiwan_city/" + ($(this).val()), function(data) {
            var i, len, option, results;
            results = [];
            for (i = 0, len = data.length; i < len; i++) {
              option = data[i];
              results.push(next_selects.first()[0].options.add(new Option(option[0], option[1])));
            }
            return results;
          });
        }
      });
    });
  };
  return $(function() {
    return $('.city-group').taiwan_city();
  });
})