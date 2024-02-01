package com.example.quiz;

public class Question {
    private int mTextResultId;
    private boolean mAnswerTrue;
    public int getTextResultId() {
        return mTextResultId;
    }
    public void setTextResultId(int textResultId) {
        mTextResultId = textResultId;
    }
    public boolean isAnswerTrue() {
        return mAnswerTrue;
    }
    public void setAnswerTrue(boolean answerTrue) {
        mAnswerTrue = answerTrue;
    }
    public Question(int textResultId, boolean answerTrue) {
        mTextResultId = textResultId;
        mAnswerTrue = answerTrue;
    }
}
