describe('homes', function(){
  loadFixtures('game_board.html');
  it('removes disabled from a button', function() {
    $(".box_4 input[type='submit']").attr('disabled', 'disabled');
    expect(remove_disabled($(".box_4 input[type='submit']"))).not.toBeDisabled();
  });
});
