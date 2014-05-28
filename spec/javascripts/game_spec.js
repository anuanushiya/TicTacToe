describe('game', function(){
  beforeEach(function() {
    loadFixtures('game_board.html');
    jasmine.clock().install();
  });

  it('removes disabled attribute from a button', function() {
    var computer_move = $('#computer_move').val();
    var button = $(String.concat(".box_", computer_move, " input[type='submit']"));
    removeDisabled(button);
    expect(button).not.toBeDisabled();
  });

  it('clicks on the link indicated by hidden_field computer_move', function() {
    var computer_move = $('#computer_move').val();
    var button = $(String.concat(".box_", computer_move, " input[type='submit']"));
    spyOnEvent(button, 'click');
    clickButton(button);
    jasmine.clock().tick(1);
    expect('click').toHaveBeenTriggeredOn(button);
  });

  it('plays the computer move when page is loaded', function() {
    var computer_move = $('#computer_move').val();
    var button = $(String.concat(".box_", computer_move, " input[type='submit']"));
    spyOnEvent(button, 'click');
    computer_play(button);
    jasmine.clock().tick(1);
    expect('click').toHaveBeenTriggeredOn(button);
  });
});
