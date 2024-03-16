package com.learning.criminalintentiad;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class CrimeListFragment extends Fragment {
  private static final int REQUEST_CRIME = 1;
  private RecyclerView mCrimeRecycleView;
  private boolean mSubtitleVisible;
  private static final String SAVE_SUBTITLE_VISIBLE = "subtitle";
  private class CrimeHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
    private Crime mCrime;
    private final TextView mTitleTextView;
    private final TextView mDateTextView;
    private final CheckBox mSolvedCheckBox;
    public CrimeHolder(View itemView) {
      super(itemView);
      itemView.setOnClickListener(this);

      mTitleTextView = (TextView) itemView.findViewById(R.id.list_item_crime_title_text_view);
      mDateTextView = (TextView) itemView.findViewById(R.id.list_item_crime_date_text_view);
      mSolvedCheckBox = (CheckBox) itemView.findViewById(R.id.list_item_crime_solved_check_box);
    }
    public void bindCrime(Crime crime) {
      mCrime = crime;
      mTitleTextView.setText(mCrime.getTitle());
      mDateTextView.setText(mCrime.getDate().toString());
      mSolvedCheckBox.setChecked(mCrime.isSolved());
    }

    @Override
    public void onClick(View v) {
      Intent intent = CrimePagerActivity.newIntent(getActivity(), mCrime.getId());
      startActivity(intent);
    }
  }
  private class CrimeAdapter extends RecyclerView.Adapter<CrimeHolder> {
      private final List<Crime> mCrimes;
      public CrimeAdapter(List<Crime> crimes) {
        mCrimes = crimes;
      }

      @NonNull
      @Override
      public CrimeHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(getActivity());
        View view = layoutInflater.inflate(R.layout.list_item_crime, parent, false);
        return new CrimeHolder(view);
      }

      @Override
      public void onBindViewHolder(@NonNull CrimeHolder holder, int position) {
        Crime crime = mCrimes.get(position);
        holder.bindCrime(crime);
      }

      @Override
      public int getItemCount() {
        return mCrimes.size();
      }
    }

  @Override
  public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
    if (requestCode == REQUEST_CRIME) {

    }
    super.onActivityResult(requestCode, resultCode, data);
  }

  @Nullable
  @Override
  public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

    View view = inflater.inflate(R.layout.fragment_crime_list, container, false);

    mCrimeRecycleView = (RecyclerView) view.findViewById(R.id.crime_recycler_view);
    mCrimeRecycleView.setLayoutManager(new LinearLayoutManager(getActivity()));

    if (savedInstanceState != null) {
      mSubtitleVisible = savedInstanceState.getBoolean(SAVE_SUBTITLE_VISIBLE);
    }

    updateUI();

    return view;
  }

  @Override
  public void onSaveInstanceState(@NonNull Bundle outState) {
    super.onSaveInstanceState(outState);
    outState.putBoolean(SAVE_SUBTITLE_VISIBLE, mSubtitleVisible);
  }

  @Override
  public void onResume() {
    super.onResume();
    updateUI();
  }
  private void updateUI() {
    CrimeAdapter mAdapter = null;
    CrimeLab crimeLab = CrimeLab.get(getActivity());
    List<Crime> crimes = crimeLab.getCrimes();

    if (mAdapter == null) {
      mAdapter = new CrimeAdapter(crimes);
      mCrimeRecycleView.setAdapter(mAdapter);
    } else {
      mAdapter.notifyDataSetChanged();
    }

    updateSubtitle();

  }

  @Override
  public void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setHasOptionsMenu(true);
  }

  @Override
  public void onCreateOptionsMenu(@NonNull Menu menu, @NonNull MenuInflater inflater) {
    super.onCreateOptionsMenu(menu, inflater);
    inflater.inflate(R.menu.fragment_crime_list, menu);

    MenuItem subtitleItem = menu.findItem(R.id.menu_item_show_subtitle);
    if (mSubtitleVisible) {
      subtitleItem.setTitle(R.string.hide_subtitle);
    } else {
      subtitleItem.setTitle(R.string.show_subtitle);
    }
  }

  @Override
  public boolean onOptionsItemSelected(@NonNull MenuItem item) {

    if (item.getItemId() == R.id.menu_item_new_crime) {
      Crime crime = new Crime();
      CrimeLab.get(getActivity()).addCrime(crime);
      Intent intent = CrimePagerActivity.newIntent(getActivity(), crime.getId());
      startActivity(intent);
      return true;
    }
    if (item.getItemId() == R.id.menu_item_show_subtitle) {
      mSubtitleVisible = !mSubtitleVisible;
      getActivity().invalidateOptionsMenu();
      updateSubtitle();
      return true;
    }
    return super.onOptionsItemSelected(item);
  }

  private void updateSubtitle() {
    CrimeLab crimeLab = CrimeLab.get(getActivity());
    int crimeCount = crimeLab.getCrimes().size();
    String subtitle = getResources().getQuantityString(R.plurals.subtitle_plural, crimeCount, crimeCount);

    if (!mSubtitleVisible) {
      subtitle = null;
    }

    AppCompatActivity activity = (AppCompatActivity) getActivity();
    activity.getSupportActionBar().setSubtitle(subtitle);
  }
}
