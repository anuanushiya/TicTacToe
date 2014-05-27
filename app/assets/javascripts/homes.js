function removeDisabled(button) {
  button.removeAttr('disabled');
}

function clickButton(button) {
  setTimeout(function() {button.click()}, 1);
}

$(document).ready(function() {
  var computer_move = $('#computer_move').val();
  var computer_button = $(String.concat('.box_', computer_move, " input[type='submit']"));
  if ($('#turn').val() == 'o' && $('h2.winner').text().length == 0) {
    removeDisabled(computer_button);
    clickButton(computer_button);
  }
});
