
const menu = () => {
  document.getElementById("pocket").addEventListener("click", (event) => {
    const x = document.getElementById("backpack");
    if(x.style.display == 'block')
          x.style.display = 'none';
       else
          x.style.display = 'block';
  });
}

export { menu };


