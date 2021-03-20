const playAgain = () => {
  const btnPlayAgain = document.getElementById("replay-button");
  if (btnPlayAgain) {
      // console.log('hello');
        btnPlayAgain.addEventListener ('click', () => {
          window.location.reload();
        })
    }
}

export { playAgain }