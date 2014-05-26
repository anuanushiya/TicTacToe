function computer_button() {
  if ($('#turn').val() == 'o' && $('h2.winner').text().length == 0) {
    var computer_move = $('#computer_move').val();
    var computer_button = String.concat('.box_', computer_move, " input[type='submit']");
    $(computer_button).removeAttr('disabled');
    setTimeout(function() {$(computer_button).click()}, 1);
  }
};

$(document).ready(function() {
    computer_button();
});
