const playAgain = () => {
  const btnPlayAgain = document.getElementById('replay-button');
  if (btnPlayAgain) {
    btnPlayAgain.addEventListener('click', () => {
      window.location.reload();
    });
  }
};

export { playAgain };
