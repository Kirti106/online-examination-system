package com.onlineexam.model;

public class Result {
    private int resultId;
    private int studentId;
    private int examId;
    private int score;
    private double percentage;
    private String grade;

    public Result() {}

    public Result(
            int resultId,
            int studentId,
            int examId,
            int score,
            double percentage,
            String grade) {

        this.resultId = resultId;
        this.studentId = studentId;
        this.examId = examId;
        this.score = score;
        this.percentage = percentage;
        this.grade = grade;
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public void displayResult() {

        System.out.println("Score: " + score);
        System.out.println(
                "Percentage: " + percentage + "%"
        );
        System.out.println("Grade: " + grade);
    }
}