package com.awesomeproject;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class ImagePickerModule extends ReactContextBaseJavaModule {
  @NonNull
  @Override
  public String getName() {
    return "ImagePickerModule";
  }
  private static final int IMAGE_PICKER_REQUEST = 1;
  private static final String E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST";
  private static final String E_PICKER_CANCELLED = "E_PICKER_CANCELLED";
  private static final String E_FAILED_TO_SHOW_PICKER = "E_FAILED_TO_SHOW_PICKER";
  private static final String E_NO_IMAGE_DATA_FOUND = "E_NO_IMAGE_FOUND";
  private Promise mPikcerPromise;
  ImagePickerModule(ReactApplicationContext reactContext) {
    super(reactContext);

    reactContext.addActivityEventListener(mActivityEventListener);
  }
  private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {
    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, @Nullable Intent data) {
      if (requestCode == IMAGE_PICKER_REQUEST) {
        if (mPikcerPromise != null) {

          if (requestCode == Activity.RESULT_CANCELED) {
            mPikcerPromise.reject(E_PICKER_CANCELLED, "Image picker was cancelled");
          } else if (resultCode == Activity.RESULT_OK && data != null) {
            Uri uri = data.getData();

            if (uri == null) {
              mPikcerPromise.reject(E_NO_IMAGE_DATA_FOUND, "No image data found");
            } else {
              mPikcerPromise.resolve(uri.toString());
            }

          }

          mPikcerPromise = null;
        }
      }
    }
  };


  @ReactMethod
  public void pickImage(final Promise promise) {
    Activity currentActivity = getCurrentActivity();

    if (currentActivity == null) {
      promise.reject(E_ACTIVITY_DOES_NOT_EXIST, "Activity doesn't exist");
      return;
    }

    mPikcerPromise = promise;

    try {
      final Intent galleryIntent = new Intent(Intent.ACTION_PICK);
      galleryIntent.setType("image/*");
      final  Intent chooserIntent = Intent.createChooser(galleryIntent, "Pick an image");
      currentActivity.startActivityForResult(chooserIntent, IMAGE_PICKER_REQUEST);
    } catch (Exception e) {
      mPikcerPromise.reject(E_FAILED_TO_SHOW_PICKER, e);
      mPikcerPromise = null;
    }
  }

}
