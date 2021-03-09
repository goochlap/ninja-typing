
const avatarMoving = () => {
  //set timeout when click on game
  const buttonGameShow = document.getElementById('game-show');
  const buttonGameShow2 = document.getElementById('game-show2');
  
  buttonGameShow.addEventListener("click", (event) => {
    setTimeout(function(){buttonGameShow2.click()}, 3000);
    event.preventDefault();
    document.getElementById('menu-button').id = 'menu-button2'
  });
};

export { avatarMoving };