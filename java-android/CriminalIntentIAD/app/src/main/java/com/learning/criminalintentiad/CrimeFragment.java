package com.learning.criminalintentiad;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.google.android.material.textfield.TextInputEditText;

public class CrimeFragment extends Fragment {
  private Crime mCrime;
  @Override
  public void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    mCrime = new Crime();
  }

  @Nullable
  @Override
  public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
    // false - представление будет добавлено в коде активности.
    View view = inflater.inflate(R.layout.fragment_crime, container, false);

    //EditText mTitleField = (EditText)view.findViewById(R.id.crime_title);
    TextInputEditText mTitleField = (TextInputEditText)view.findViewById(R.id.crime_title);
    mTitleField.addTextChangedListener(new TextWatcher() {
      @Override
      public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        mCrime.setTitle(s.toString());
      }

      @Override
      public void onTextChanged(CharSequence s, int start, int before, int count) {

      }

      @Override
      public void afterTextChanged(Editable s) {

      }
    });

    Button mDateButton = (Button) view.findViewById(R.id.crime_date);
    CharSequence date = DateFormat.format("EEEE, MMM dd, yyyy", mCrime.getDate());
    mDateButton.setText(date.toString());
    mDateButton.setEnabled(false);

    CheckBox mSolvedCheckBox = (CheckBox)view.findViewById(R.id.crime_solved);
    mSolvedCheckBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
      @Override
      public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        mCrime.setSolved(isChecked);
      }
    });

    return view;

  }
}
