const playAgain = () => {
  const btnPlayAgain = document.getElementById("button-popup");
    if (btnPlayAgain) {
        btnPlayAgain.addEventListener ('click', () => {
          window.location.reload();
        })
    }
}

export { playAgain }