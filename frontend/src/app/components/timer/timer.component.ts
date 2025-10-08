import {Component, EventEmitter, Input, OnChanges, OnDestroy, Output, SimpleChanges} from '@angular/core';

@Component({
  selector: 'app-timer',
  imports: [],
  standalone: true,
  templateUrl: './timer.component.html',
  styleUrl: './timer.component.scss'
})
export class TimerComponent implements OnChanges, OnDestroy {
  @Input() timerData: string | number | null = null;
  @Output() emitter = new EventEmitter();

  formattedHours: string = '00';
  formattedMinutes: string = '00';
  formattedSeconds: string = '00';
  isFinished: boolean = false;

  private intervalId: any;

  ngOnChanges(changes: SimpleChanges) {
    if (changes['timerData']) {
      this.startTimer();
    }
  }

  private startTimer() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = null;
    }

    if (!this.timerData) {
      this.resetDisplay();
      return;
    }

    this.updateDisplay();

    this.intervalId = setInterval(() => {
      this.updateDisplay();
    }, 1000);
  }


  private updateDisplay() {
    if (!this.timerData) return this.resetDisplay();

    const now = Date.now();
    const targetTime = typeof this.timerData === 'number' ? this.timerData : new Date(this.timerData).getTime();

    let remainingMs = targetTime - now;

    if (remainingMs <= 0) {
      remainingMs = 0;
      this.isFinished = true;
      clearInterval(this.intervalId);
      this.sendEvent('finished');
    } else {
      this.isFinished = false;
    }

    const remainingSeconds = Math.floor(remainingMs / 1000);

    const hours = Math.floor(remainingSeconds / 3600);
    const minutes = Math.floor((remainingSeconds % 3600) / 60);
    const seconds = remainingSeconds % 60;

    this.formattedHours = hours.toString().padStart(2, '0');
    this.formattedMinutes = minutes.toString().padStart(2, '0');
    this.formattedSeconds = seconds.toString().padStart(2, '0');
  }

  private resetDisplay() {
    this.formattedHours = '00';
    this.formattedMinutes = '00';
    this.formattedSeconds = '00';
    this.isFinished = false;
  }

  sendEvent(event: string) {
    this.emitter.emit({ event: `TimerComponent:${event}` });
  }

  ngOnDestroy() {
    if (this.intervalId) clearInterval(this.intervalId);
    this.sendEvent('clearTimer');
  }
}
