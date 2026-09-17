package com.onlineexam.model;

public class Answer {
    private int answerId;
    private int studentId;
    private int examId;
    private int questionId;
    private String selectedAnswer;

    public Answer() {}

    public Answer(
            int answerId,
            int studentId,
            int examId,
            int questionId,
            String selectedAnswer) {

        this.answerId = answerId;
        this.studentId = studentId;
        this.examId = examId;
        this.questionId = questionId;
        this.selectedAnswer = selectedAnswer;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
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

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getSelectedAnswer() {
        return selectedAnswer;
    }

    public void setSelectedAnswer(String selectedAnswer) {
        this.selectedAnswer = selectedAnswer;
    }
}