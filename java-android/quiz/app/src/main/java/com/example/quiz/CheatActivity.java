package com.example.quiz;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class CheatActivity extends AppCompatActivity {
  private static final String TAG = "CheatActivity";
  private static final String KEY_INDEX = "index";
  public static final String EXTRA_ANSWER_IS_TRUE = "com.example.quiz.answer_is_true";
  public static final String EXTRA_ANSWER_SHOWN = "com.example.quiz.answer_shown";
  private boolean mAnswerIsTrue;

  private boolean mIsCheater = false;
  public static Intent newIntent(Context packageContext, boolean answerIsTrue) {
    Intent intent = new Intent(packageContext, CheatActivity.class);
    intent.putExtra(EXTRA_ANSWER_IS_TRUE, answerIsTrue);
    return intent;
  }
  public static boolean wasAnswerShown(Intent result) {
    return result.getBooleanExtra(EXTRA_ANSWER_SHOWN, false);
  }
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_cheat);

    mAnswerIsTrue = getIntent().getBooleanExtra(EXTRA_ANSWER_IS_TRUE, false);

    TextView mAnswerTextView = (TextView) findViewById(R.id.answer_text_view);

    Button mShowAnswer = (Button)findViewById(R.id.show_answer_button);
    mShowAnswer.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        if (mAnswerIsTrue) {
          mAnswerTextView.setText(R.string.true_button);
        } else {
          mAnswerTextView.setText(R.string.false_button);
        }
        setAnswerShownResult();
      }
    });

    if (savedInstanceState != null) {
      mIsCheater = savedInstanceState.getBoolean(KEY_INDEX, false);
      Log.d(TAG, String.format("mIsCheater=%b", mIsCheater));
      setAnswerShownResult();
    }
  }

  private void setAnswerShownResult() {
    mIsCheater = true;
    Intent backIntent = new Intent();
    backIntent.putExtra(EXTRA_ANSWER_SHOWN, mIsCheater);
    Log.d(TAG, String.format("Set result mIsCheater=%b", mIsCheater));
    setResult(RESULT_OK, backIntent);
  }

  @Override
  protected void onSaveInstanceState(@NonNull Bundle outState) {
    super.onSaveInstanceState(outState);
    Log.i(TAG, "onSaveInstanceState");
    outState.putBoolean(KEY_INDEX, mIsCheater);
  }
}