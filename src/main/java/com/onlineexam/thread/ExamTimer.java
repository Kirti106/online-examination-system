package com.onlineexam.thread;

public class ExamTimer extends Thread {
    private int remainingSeconds;
    private boolean running;

    public ExamTimer(int durationMinutes) {
        this.remainingSeconds = durationMinutes * 60;
        this.running = true;
    }

    @Override
    public void run() {
        while (running && remainingSeconds > 0) {
            try {
                Thread.sleep(1000);
                remainingSeconds--;
                System.out.println("Exam Timer: " + remainingSeconds + " seconds remaining");
            } 
            catch (InterruptedException e) {
                System.out.println("Exam timer interrupted.");
                running = false;
            }
        }

        if (remainingSeconds <= 0) {
            System.out.println( "Exam time completed.");
        }
    }

    public synchronized int getRemainingSeconds() {
        return remainingSeconds;
    }

    public synchronized void stopTimer() {
        running = false;
        interrupt();
    }
}