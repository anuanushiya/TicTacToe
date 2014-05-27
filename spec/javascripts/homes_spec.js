describe('homes', function(){
  beforeEach(function() {
    timerCallback = jasmine.createSpy("timerCallback");
    jasmine.clock().install();
  });

  it('removes disabled from a button', function() {
    loadFixtures('game_board.html');
    var button_4 = $(".box_4 input[type='submit']")
    removeDisabled(button_4);
    expect(button_4).not.toBeDisabled();
  });

  it('clicks on the link indicated by hidden_field computer_move', function() {
    loadFixtures('game_board.html');
    var computer_move = $('#computer_move').val();
    var button = $(String.concat(".box_", computer_move, " input[type='submit']"));
    spyOnEvent(button, 'click');
    clickButton(button);
    jasmine.clock().tick(10);
    expect('click').toHaveBeenTriggeredOn(button);
  });
});
