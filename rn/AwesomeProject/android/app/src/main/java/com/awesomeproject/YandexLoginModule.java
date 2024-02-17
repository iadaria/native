package com.awesomeproject;


import static androidx.activity.result.ActivityResultCallerKt.registerForActivityResult;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;


import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.yandex.authsdk.YandexAuthException;
import com.yandex.authsdk.YandexAuthLoginOptions;
import com.yandex.authsdk.YandexAuthOptions;
import com.yandex.authsdk.YandexAuthResult;
import com.yandex.authsdk.YandexAuthSdk;
import com.yandex.authsdk.YandexAuthToken;

public class YandexLoginModule extends ReactContextBaseJavaModule {
  private final String TAG = "YandexLoginModule";
  private static final int YANDEX_LOGIN_REQUEST = 1;
  private static final String E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST";
  private static final String E_YANDEX_LOGIN_CANCELLED = "E_YANDEX_LOGIN_CANCELLED";
  private static final String E_FAILED_TO_SHOW_LOGIN = "E_FAILED_TO_SHOW_LOGIN";
  private static final String E_NO_ACCOUNT_FOUND="E_NO_ACCOUNT_FOUND";
  @Nullable
  private Promise mYandexLoginPromise;
  @Nullable
  private YandexAuthToken mYandexAuthToken;
  @Nullable
  private YandexAuthSdk mYandexAuthSdk;
  YandexLoginModule(ReactApplicationContext reactContext) {
    super(reactContext);
    reactContext.addActivityEventListener(mActivityEventListener);
    mYandexAuthSdk = YandexAuthSdk.create(new YandexAuthOptions(reactContext));

  }
  @NonNull
  @Override
  public String getName() {
    return "YandexLoginModule";
  }

  private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {
    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, @Nullable Intent data) {
      //Log.d(TAG, "[onActivityResult] I am here " + String.valueOf(resultCode) + ", " + String.valueOf(data.getData()));
      if (requestCode == YANDEX_LOGIN_REQUEST) {
        if (mYandexLoginPromise != null) {
          YandexAuthResult result = mYandexAuthSdk.getContract().parseResult(resultCode, data);
          handleResult(result);
        }
      } else {
        super.onActivityResult(activity, requestCode, resultCode, data);
      }
    }
  };

  @ReactMethod
  public void login(final String email, final Promise promise) {
    Activity currentActivity = getCurrentActivity();

    if (currentActivity == null) {
      promise.reject(E_ACTIVITY_DOES_NOT_EXIST, "Activity doesn't exist");
      return;
    }

    mYandexLoginPromise = promise;

    if (mYandexAuthToken != null) {
      promise.resolve(mYandexAuthToken.getValue());
      return;
    }

    // Dev
    Log.d(TAG, "Create event called with name: " + email);

    try {
      final YandexAuthLoginOptions loginOptions = new YandexAuthLoginOptions();
      Intent intent = mYandexAuthSdk.getContract().createIntent(getReactApplicationContext(), loginOptions);
      currentActivity.startActivityForResult(intent, YANDEX_LOGIN_REQUEST);
    } catch (Exception e) {
      mYandexLoginPromise.reject(E_FAILED_TO_SHOW_LOGIN, e);
      mYandexLoginPromise = null;
    }
  }

  private void handleResult(YandexAuthResult result) {
    if (result instanceof YandexAuthResult.Success) {
      mYandexAuthToken =  ((YandexAuthResult.Success) result).getToken();
      Log.d(TAG, "Got token!" + String.valueOf(mYandexAuthToken));
    } else if (result instanceof  YandexAuthResult.Failure) {
      YandexAuthException error = ((YandexAuthResult.Failure) result).getException();
      mYandexLoginPromise.reject("[Yandex handleResult()/Error]", error);
    }
  }

}
