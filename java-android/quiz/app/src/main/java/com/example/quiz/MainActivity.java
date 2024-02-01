package com.example.quiz;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    private Button mTrueButton;
    private Button mFalseButton;
    private ImageButton mNextButton;
    private ImageButton mPrevButton;
    private TextView mQuestionTextView;
    private int mCurrentIndex = 0;
    private Question[] mQuestionBank = new Question[] {
        new Question(R.string.question_oceans, true),
        new Question(R.string.question_mideast, false),
        new Question(R.string.question_africa, false),
        new Question(R.string.question_americas, true),
        new Question(R.string.question_asia, true),
    };
    private void updateQuestion() {
        int question = mQuestionBank[mCurrentIndex].getTextResultId();
        mQuestionTextView.setText(question);
    }

    private void changeQuestion(int digit) {
        if (digit < 0 && mCurrentIndex == 0) {
            mCurrentIndex = mQuestionBank.length - 1;
        } else {
            mCurrentIndex = (mCurrentIndex + digit) % mQuestionBank.length;
        }
        updateQuestion();
    }
    private void checkAnswer(boolean userPressedTrue) {
        boolean answerIsTrue = mQuestionBank[mCurrentIndex].isAnswerTrue();

        int messageResultId = 0;

        if (userPressedTrue == answerIsTrue) {
            messageResultId = R.string.correct_toast;
        } else {
            messageResultId = R.string.incorrect_toast;
        }

        Toast.makeText(this, messageResultId, Toast.LENGTH_SHORT).show();
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Init question
        mQuestionTextView = (TextView)findViewById(R.id.question_text_view);
        // True and False buttons
        mTrueButton = (Button) findViewById(R.id.true_button);
        mTrueButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                checkAnswer(true);
            }
        });
        mFalseButton = (Button) findViewById(R.id.false_button);
        mFalseButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                checkAnswer(false);
            }
        });
        // Next button
        mNextButton = (ImageButton) findViewById(R.id.next_button);
        mNextButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                changeQuestion(+1);
            }
        });
        mPrevButton = (ImageButton) findViewById(R.id.prev_button);
        mPrevButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    changeQuestion(-1);
            }
        });
        mQuestionTextView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                changeQuestion(+1);
            }
        });
        updateQuestion();
    }
}