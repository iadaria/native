package com.learning.criminalintentiad;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentResultListener;

import com.google.android.material.textfield.TextInputEditText;

import java.util.Date;
import java.util.UUID;

public class CrimeFragment extends Fragment {
  private static final String ARG_CRIME_ID = "crime_id";
  private static final String DIALOG_DATE = "DialogDate";
  private static final String DIALOG_TIME = "DialogTime";

  private static final int REQUEST_DATE = 0;
  private static final int REQUEST_TIME = 1;
  private Crime mCrime;
  Button mDateButton;
  Button mTimeButton;

  public static CrimeFragment newInstance(UUID crimeId) {
    Bundle args = new Bundle();
    args.putSerializable(ARG_CRIME_ID, crimeId);

    CrimeFragment fragment = new CrimeFragment();
    fragment.setArguments(args);
    return fragment;
  }
  @Override
  public void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    UUID crimeId = (UUID) getArguments().getSerializable(ARG_CRIME_ID);
    mCrime = CrimeLab.get(getActivity()).getCrime(crimeId);

    setHasOptionsMenu(true);
  }

  public void returnResult() {
    getActivity().setResult(Activity.RESULT_OK, null);
  }

  @Nullable
  @Override
  public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
    // false - представление будет добавлено в коде активности.
    View view = inflater.inflate(R.layout.fragment_crime, container, false);

    TextInputEditText mTitleField = (TextInputEditText)view.findViewById(R.id.crime_title);
    mTitleField.setText(mCrime.getTitle());
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

    mDateButton = (Button) view.findViewById(R.id.crime_date);
    updateDate();
    mDateButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        FragmentManager manager = getActivity().getSupportFragmentManager();
        DatePickerFragment dialog = DatePickerFragment
            .newInstance(mCrime.getDate());
        dialog.setTargetFragment(CrimeFragment.this, REQUEST_DATE);
        dialog.show(manager, DIALOG_DATE);
      }
    });

    mTimeButton = (Button) view.findViewById(R.id.crime_time);
    updateTime();
    mTimeButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        FragmentManager manager = getParentFragmentManager();
        manager.setFragmentResultListener(TimePickerFragment.REQUEST_TIME_KEY, getActivity(), new FragmentResultListener() {
          @Override
          public void onFragmentResult(@NonNull String requestKey, @NonNull Bundle result) {
            Date date = (Date) result.getSerializable(TimePickerFragment.EXTRA_TIME);
            mCrime.setDate(date);
            updateTime();
          }
        });
        TimePickerFragment dialog = TimePickerFragment.newInstance(mCrime.getDate());
        dialog.show(manager, DIALOG_TIME);
      }
    });


    CheckBox mSolvedCheckBox = (CheckBox)view.findViewById(R.id.crime_solved);
    mSolvedCheckBox.setChecked(mCrime.isSolved());
    mSolvedCheckBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
      @Override
      public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        mCrime.setSolved(isChecked);
      }
    });

    return view;

  }
  @Override
  public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
    if (resultCode != Activity.RESULT_OK) {
      return;
    }
    if (requestCode == REQUEST_DATE) {
      Date date = (Date) data.getSerializableExtra(DatePickerFragment.EXTRA_DATE);
      mCrime.setDate(date);
      updateDate();
    }

    /*if (requestCode == REQUEST_TIME) {
      Date date = (Date) data.getSerializableExtra(TimePickerFragment.EXTRA_TIME);
      mCrime.setDate(date);
      updateTime();
    }*/
  }

  private void updateDate() {
    CharSequence date = DateFormat.format("EEEE, MMM dd, yyyy", mCrime.getDate());
    mDateButton.setText(date.toString());
  }

  private void updateTime() {
    CharSequence time = DateFormat.format("HH:mm:ss", mCrime.getDate());
    mTimeButton.setText(time.toString());
  }

  @Override
  public void onCreateOptionsMenu(@NonNull Menu menu, @NonNull MenuInflater inflater) {
    super.onCreateOptionsMenu(menu, inflater);
    inflater.inflate(R.menu.fragment_crime, menu);
  }

  @Override
  public boolean onOptionsItemSelected(@NonNull MenuItem item) {

    if (item.getItemId() == R.id.menu_item_delete_crime) {
      CrimeLab.get(getActivity()).removeCrime(mCrime);
      getActivity().finish();
      return true;
    }

    return super.onOptionsItemSelected(item);
  }
}
