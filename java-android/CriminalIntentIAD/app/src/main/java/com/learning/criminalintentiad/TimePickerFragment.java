package com.learning.criminalintentiad;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TimePicker;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

import java.util.Calendar;
import java.util.Date;

public class TimePickerFragment extends DialogFragment {
  public static final String REQUEST_TIME_KEY = "RequestTime";
  private static final String ARG_TIME = "time";
  public static final String EXTRA_TIME = "com.iadaria.android.time";

  private TimePicker mTimePicker;
  private Date mDate;

  private UpdatableDate mUpdatableDate;
  public static TimePickerFragment newInstance(Date date) {
    Bundle args = new Bundle();
    args.putSerializable(ARG_TIME, date);

    TimePickerFragment fragment = new TimePickerFragment();
    fragment.setArguments(args);

    return fragment;
  }

  @NonNull
  @Override
  public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
    mDate = (Date) getArguments().getSerializable(ARG_TIME);

    Calendar calendar = Calendar.getInstance();
    calendar.setTime(mDate);
    int hour = calendar.get(Calendar.HOUR);
    int minute = calendar.get(Calendar.MINUTE);
    int second = calendar.get(Calendar.SECOND);

    View view = LayoutInflater.from(getActivity()).inflate(R.layout.dialog_time,null);

    mTimePicker = (TimePicker) view.findViewById((R.id.dialog_time_picker));
    mTimePicker.setHour(hour);
    mTimePicker.setMinute(minute);

    return new AlertDialog.Builder(getActivity())
        .setView(view)
        .setTitle(R.string.time_picker_title)
        .setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
          @Override
          public void onClick(DialogInterface dialog, int which) {
            int hour = mTimePicker.getHour();
            int minute = mTimePicker.getMinute();
            mDate.setHours(hour);
            mDate.setMinutes(minute);

            Bundle args = new Bundle();
            args.putSerializable(EXTRA_TIME, mDate);

            getParentFragmentManager().setFragmentResult(REQUEST_TIME_KEY, args);

            //sendResult(Activity.RESULT_OK, mDate);
            //mUpdatableDate.updateDate(mDate);
          }
        })
        .create();
  }

  private void sendResult(int resultCode, Date date) {
    if (getTargetFragment() == null) {
      return ;
    }
    Intent intent = new Intent();
    intent.putExtra(EXTRA_TIME, date);

    getTargetFragment().onActivityResult(getTargetRequestCode(), resultCode, intent);
  }
}
