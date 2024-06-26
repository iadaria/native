package com.awesomeproject;

import static android.provider.Settings.System.getString;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.yandex.authsdk.YandexAuthException;
import com.yandex.authsdk.YandexAuthLoginOptions;
import com.yandex.authsdk.YandexAuthOptions;
import com.yandex.authsdk.YandexAuthResult;
import com.yandex.authsdk.YandexAuthSdk;
import com.yandex.authsdk.YandexAuthToken;

import java.util.Base64;

public class YandexLoginModule extends ReactContextBaseJavaModule {
  private final String TAG = "YandexLoginModule";
  private static final int YANDEX_LOGIN_REQUEST = 1;
  private static final String E_ACTIVITY_DOES_NOT_EXIST = "E_ACTIVITY_DOES_NOT_EXIST";
  private static final String E_YANDEX_LOGIN_CANCELLED = "E_YANDEX_LOGIN_CANCELLED";
  private static final String E_FAILED_TO_SHOW_LOGIN = "E_FAILED_TO_SHOW_LOGIN";
  private static final String E_FAILED_HANDLE_RESULT = "E_FAILED_HANDLE_RESULT";
  @Nullable
  private Promise mYandexLoginPromise;
  @Nullable
  private YandexAuthToken mYandexAuthToken;
  @Nullable
  private final YandexAuthSdk mYandexAuthSdk;
  YandexLoginModule(ReactApplicationContext reactContext) {
    super(reactContext);
    //Log.d(TAG, "[onActivityResult] I am here " + String.valueOf(resultCode) + ", " + String.valueOf(data.getData()));
    ActivityEventListener activityEventListener = new BaseActivityEventListener() {
      @Override
      public void onActivityResult(Activity activity, int requestCode, int resultCode, @Nullable Intent data) {
        if (requestCode == YANDEX_LOGIN_REQUEST) {
          if (mYandexLoginPromise != null && mYandexAuthSdk != null) {
            YandexAuthResult result = mYandexAuthSdk.getContract().parseResult(resultCode, data);
            handleResult(result);
          }
        } else {
          super.onActivityResult(activity, requestCode, resultCode, data);
        }
      }
    };

    reactContext.addActivityEventListener(activityEventListener);

    mYandexAuthSdk = YandexAuthSdk.create(new YandexAuthOptions(reactContext));
  }
  @NonNull
  @Override
  public String getName() {
    return "YandexLoginModule";
  }

  // https://stackoverflow.com/questions/28108443/how-to-use-resvalu
  // //resValue returns int instead stringe
  @ReactMethod
  public void getClientId(final Promise promise) {
    try {
      Resources res = getReactApplicationContext().getResources();
      String s = res.getString(R.string.clientId);
      Log.i(TAG, s);
      promise.resolve(s);
    } catch(Exception e) {
      promise.reject("Error to get buildConfig. Did you fill in cliendId?", e);
    }
  }
  @ReactMethod
  public void login(final Promise promise) {
    Activity currentActivity = getCurrentActivity();

    if (currentActivity == null) {
      promise.reject(E_ACTIVITY_DOES_NOT_EXIST, "Activity doesn't exist");
      return;
    }

    mYandexLoginPromise = promise;

    if (mYandexAuthToken != null) {
      resolveToken();
      return;
    }

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
    if (mYandexLoginPromise == null) throw new Error("Couldn't get promise from React Native app");

    if (result instanceof YandexAuthResult.Success) {
      mYandexAuthToken =  ((YandexAuthResult.Success) result).getToken();
      resolveToken();


    } else if (result instanceof  YandexAuthResult.Failure) {
      YandexAuthException error = ((YandexAuthResult.Failure) result).getException();
      mYandexLoginPromise.reject("Getting the yandex token fails", error);
    }
    Log.d(TAG, "The result is cancelled");
  }

  private void resolveToken() {

    try {
      WritableMap params = Arguments.createMap();
      params.putString("token", mYandexAuthToken.getValue());
      params.putString("expiresIn", String.valueOf(mYandexAuthToken.getExpiresIn()));
      mYandexLoginPromise.resolve(params);

      Log.d(TAG, "expire at " + mYandexAuthToken.getExpiresIn());
    } catch (Exception e) {
      mYandexLoginPromise.reject(E_FAILED_HANDLE_RESULT, e);
      mYandexLoginPromise = null;
    }
  }
}
