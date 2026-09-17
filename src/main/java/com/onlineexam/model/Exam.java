package com.onlineexam.model;

public class Exam {
    private int examId;
    private String examName;
    private String subject;
    private int duration;
    private int totalQuestions;

    public Exam() {}

    public Exam(
            int examId,
            String examName,
            String subject,
            int duration,
            int totalQuestions) {

        this.examId = examId;
        this.examName = examName;
        this.subject = subject;
        this.duration = duration;
        this.totalQuestions = totalQuestions;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }

    public void displayExamInfo() {

        System.out.println("Exam: " + examName);
        System.out.println("Subject: " + subject);
        System.out.println("Duration: " + duration + " minutes");
        System.out.println("Total Questions: " + totalQuestions);
    }
}