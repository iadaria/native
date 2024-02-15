package com.awesomeproject;

import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import java.util.HashMap;
import java.util.Map;

public class CalendarModule extends ReactContextBaseJavaModule {
  CalendarModule(ReactApplicationContext context) {
    super(context);
  }
  @NonNull
  @Override
  public String getName() {
    return "CalendarModule";
  }

  /*@ReactMethod
  public void createCalendarEvent(String name, String location, Callback callback) {
    Log.d("CalendarModule", "Create event called with name: " + name + " and location: " + location);
    Integer eventId = 1;
    callback.invoke(null, eventId);
  }*/
  @ReactMethod
  public void createCalendarEvent(String name, String location, Promise promise) {
    try {
      Integer eventId = 2;
      promise.reject("Create Event error", "Error parsing date");
      promise.resolve(eventId);
      Log.d("[promise function]", "All is Ok");
    } catch (Exception e) {
      promise.reject("Create Event Error", e);
    }
  }

  public Map<String, Object> getConstants() {
    final Map<String, Object> constants = new HashMap<>();
    constants.put("DEFAULT_EVENT_NAME", "New Event");
    return constants;
  }

  private void sendEvent(ReactContext reactContext, String eventName, @Nullable WritableMap params) {
    reactContext
        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
        .emit(eventName, params);
  }
  private int listenerCount = 0;
  @ReactMethod
  public void addListener(String eventName) {
    if (listenerCount == 0) {
      Log.d("[Java/addListener]", String.valueOf(listenerCount));
    }
    listenerCount += 1;
  }
  @ReactMethod
  public void removeListeners(Integer count) {
    listenerCount -= count;
  }

  @ReactMethod
  public void sendEventFromJS() {
    Log.d("[Java/SendEventFromJS]", "called");
    WritableMap params = Arguments.createMap();
    params.putString("eventProperty", "someValueInteresting");
    sendEvent(getReactApplicationContext(), "EventReminder", params);
  }
}
