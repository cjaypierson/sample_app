# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var supportOnInput = 'oninput' in document.createElement('input');

$("input[maxlength]").each(function() {
    var $this = $(this);
    var maxLength = parseInt($this.attr('maxlength'));
    $this.attr('maxlength', null);
    
    var el = $("<span class=\"character-count\">" + maxLength + "</span>");
    el.insertAfter($this);
    
    $this.bind(supportOnInput ? 'input' : 'keyup', function() {
        var cc = $this.val().length;
        
        el.text(maxLength - cc);
        
        if(maxLength < cc) {
            el.css('color', 'red');
        } else {
            el.css('color', null);
        }
    });
});