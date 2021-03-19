import {initHelper} from './helper';

export default class Word {
    constructor(word) {
        // events
        this.onDie = null;
        this.onHit = null;

        this.init(word);
        this.createElement();
        this.resetStartPosition();
    }

    // sets Word's properties
    init(word) {

        this.word = word;
        this.letters = word.split("");


        // if DOM element crated, change it's innerText
        if(this.el) {
          const zombies = ["word-image-zombie1", "word-image-zombie2", "word-image-zombie3", "word-image-zombie4", "word-image-zombie5" ];
          const zombie = zombies[Math.floor(Math.random() * zombies.length)];
          this.el.classList.remove(this.el.classList[1]);
          this.el.classList.add(zombie);
          this.el.innerText = this.word;
        }
    }

    createElement() {
        this.el = document.createElement("div");
        this.el.innerText = this.word;
        this.el.classList.add("word");
        const zombies = ["word-image-zombie1", "word-image-zombie2", "word-image-zombie3", "word-image-zombie4", "word-image-zombie5" ];
        const zombie = zombies[Math.floor(Math.random() * zombies.length)];
        this.el.classList.add(zombie);
        initHelper().wrapper.append(this.el);

        // set margin to center element in the view
        this.el.style.margin = `-${this.el.offsetHeight/2}px 0 0 -${this.el.offsetWidth/2}px`;
    }

    resetStartPosition() {
        // a random angle of entrance to view
        this.angle = initHelper().random(85, 95);

        // some trigonometry
        const x = Math.sin(this.angle * (Math.PI / 180)) * initHelper().radius;
        const y = Math.cos(this.angle * (Math.PI / 180)) * initHelper().radius;

        // move element to x,y
        this.elTransform = `translate(${x}px, ${y}px)`;
        // rotate to target
        // this.elTransform += `rotate(${180 - this.angle}deg)`;

        this.el.style.transform = this.elTransform;
    }

    attack() {
        const sequence = [{
            offset: 0,
            transform: this.elTransform
        },{
            offset: 1,
            transform: `translate(0,0)`
        }];

        // set difficulty
        const btnPlay = document.querySelector(".play-btn");
        let speed;
        if (btnPlay.dataset.level == "1") {
            speed = 20000
        } else if (btnPlay.dataset.level == "2") {
            speed = 15000
        } else if (btnPlay.dataset.level == "3") {
            speed = 10000
        } else {
            speed = 7500
        }
        this.attackAnimation = this.el.animate(sequence, {
            duration: speed,
            delay: 0
        });

        this.attackAnimation.onfinish = () => {
            // if animation finishes hero got hit
            this.onHit(this);
        };
    }

    stop() {
        this.attackAnimation.pause();
    }

    damage(letter) {
        this.letters.splice(0,1);
        this.el.innerText = this.letters.join("");

        if(!this.el.classList.contains("target")) {
            this.el.classList.add("target");
        }

        if(this.letters.length === 0) {
            this.onDie(this);
        }
    }

    reset(word) {
        this.el.classList.remove("target");
        this.init(word);
        this.resetStartPosition();
        this.attackAnimation.cancel();

        this.attack();
        // setTimeout(function(){
        // }, 1000);
    }

}
