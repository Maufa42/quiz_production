import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  startingMinutes = 1
  chk = this.startingMinutes * 60000
  time = this.startingMinutes * 60;
  connect() {
    this.clocktimer();
    var element = document.getElementById('aryan');
    console.log(this.clocktimer());
    setInterval(() => this.updateCountdown(),1000);
    console.log(this.time);
    setTimeout(() => this.cool(element),this.chk);
  }

  cool(ELE)
  {
    ELE.click();
    console.log("This is Function")
  }
 
  clocktimer()
  {console.log("THIS IS CLOCK")

  }

  updateCountdown(){
    console.log(this.time)
    const timer = document.getElementById('timer');
    const minutes = Math.floor(this.time / 60) ;
    let seconds = this.time % 60;

    seconds = seconds < 10 ? '0' + seconds : seconds;
    timer.innerHTML = `${minutes} : ${seconds}`;
    this.time--;
  }
}
