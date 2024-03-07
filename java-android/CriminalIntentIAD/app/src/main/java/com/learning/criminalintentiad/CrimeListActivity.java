package com.learning.criminalintentiad;

import androidx.fragment.app.Fragment;

public class CrimeListActivity extends SingleFragmentActivity {
  @Override
  protected Fragment createFragment() {
    return new CrimeListFragment();
  }
}
