import Word from './word.js';
import { initHelper } from './helper';
import { createParticipation } from '../components/fetch_score_game';
import { playAgain } from '../components/btn_play_again';

const play = () => {
    const audio = new Audio('/musique/gamemusic.mp3');
    const audioSword = new Audio('/musique/sword-audio.mp3');
    const btnPlay = document.querySelector(".play-btn");
    const result = document.querySelector(".results-game");

    if(btnPlay) {
        btnPlay.addEventListener('click', () => {

            // audio.play();
            btnPlay.style.display = 'none';
            result.style.display = 'none';
            if (document.querySelector('#ws-wrapper') != null) {
                const maxWordCount = 3; // maximum word count attacking
                let wordList

                // word database
                if (btnPlay.dataset.level == "1") {
                    wordList = ['age', 'bon', 'coq', 'dan', 'eux', 'fac', 'gin', 'jeu', 'lui', 'mon', 'vif', 'yin'];
                } else if (btnPlay.dataset.level == "2") {
                    wordList = ['ames', 'bens', 'coqs', 'dans', 'elfs', 'facs', 'gins', 'jeus', 'luis', 'mons', 'viss', 'yins'];
                } else if (btnPlay.dataset.level == "3") {
                    wordList = ['amess', 'benss', 'coqss', 'danss', 'elfss', 'facss', 'ginss', 'jeuss', 'luiss', 'monss', 'visss', 'yinss'];
                } else {
                    wordList = ['ameddd', 'benddd', 'coqddd', 'danddd', 'elfddd', 'facddd', 'ginddd', 'jeuddd', 'luiddd', 'monddd', 'visddd', 'yinddd'];
                }

                const words = [];
                let score = 0;
                let scoreElement = document.getElementById("score");

                // holds word index got hit until word dies
                let activeWordIndex = null;
                
                for (let i=0; i<maxWordCount; i++) {
                    const word = new Word(randomWord());
                    
                    // bind events
                    word.onDie = onWordDies;
                    word.onHit = onWordHits;

                    words[i] = word;
                    
                    setTimeout(function(){
                        word.attack(word);
                    }, 2000 * i);
                    
                }

                document.addEventListener("keyup", heroAttack);


                function randomWord(){
                    return wordList[ initHelper().random(0, wordList.length) ];
                }

                // called when a word dies
                function onWordDies(word) {
                    activeWordIndex = null;

                    word.reset(randomWord());
                }

                // called when a word reaches to hero
                function onWordHits(word) {
                    for (let i = 0; i < words.length; i++) {
                        // stop every words animations
                        words[i].stop();
                    }

                    // animations needs time to stop
                    setTimeout(function() {
                        // get the score to send in participations controller
                        const score   = document.getElementById("score").innerText;
                        const gameId  = document.getElementById("game-id").dataset.id;
                        const boardId = document.getElementById("board-id").dataset.id;
                        const lvlId = document.getElementById("level-id").dataset.id;

                        createParticipation(gameId, boardId, score, lvlId);
                        // alert(`GAME OVER! SCORE ${score}`)
                        audio.pause();
                        audioSword.play();

                        // display rewars & actions when game over
                        document.querySelector(".all-rewards").style.display = 'block';
                        document.querySelector(".rewards").style.display = 'block';
                        document.querySelector(".score").style.display = 'block';
                        
                        // playAgain();

                    }, 10);
                }

                function heroAttack(e) {
                    const letter = String.fromCharCode(e.keyCode).toLowerCase();

                    if(activeWordIndex === null) {
                        for (let i = 0; i < words.length; i++) {
                            if(words[i].letters[0] === letter) {
                                incrementScore();

                                activeWordIndex = i;
                                words[i].damage(letter);

                                return;
                            }

                        }
                    } else {
                        if(words[activeWordIndex].letters[0] === letter) {
                            incrementScore();
                            words[activeWordIndex].damage(letter);
                        }
                    }
                }

                function incrementScore() {
                    score++;

                    scoreElement.innerText = score;
                }

            }
        })
    }
};

export { play };
