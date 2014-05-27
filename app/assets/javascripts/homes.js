function removeDisabled(button) {
  button.removeAttr('disabled');
}

function clickButton(button) {
  setTimeout(function() {button.click()}, 1);
}

function computer_play(button) {
  if ($('#turn').val() == 'o' && $('h2.winner').text().length == 0) {
    removeDisabled(button);
    clickButton(button);
  }
};

$(document).ready(function() {
  var computer_move = $('#computer_move').val();
  var computer_button = $(String.concat('.box_', computer_move, " input[type='submit']"));
  computer_play(computer_button);
});
