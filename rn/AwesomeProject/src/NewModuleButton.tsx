import {Button, NativeEventEmitter, NativeModules, View} from 'react-native';
import React, { useEffect } from 'react';
import CalendarModule from './CalendarModule';

const { DEFAULT_EVENT_NAME } = CalendarModule.getConstants()


const NewModuleButton = () => {
  useEffect(() => {
    const eventEmitter = new NativeEventEmitter(NativeModules.CalendarModule);
    let eventListener = eventEmitter.addListener('EventReminder', event => {
      console.log(event.eventProperty);
    })

    return () => { eventListener.remove(); }
  }, []);

  const onPress = async () => {
    console.log('[RN]We will invoke the native module here!');
    console.log(DEFAULT_EVENT_NAME);
    // CalendarModule.createCalendarEvent('testName', 'testLocation',
    // (error, eventId) => {
    //     if (error) {
    //         console.error(`Error found! ${error}`);
    //     }
    //     console.log(`event id ${eventId} returned`);
    // });
    try {
        const eventId = await CalendarModule.createCalendarEvent(
        'testName2',
        'testLocation2',
        );
        console.log('[RN]', {eventId});
    } catch (e) {
        console.log('[RN] error in native module', e);
    }
    
  };
  function sendEvent() {
    CalendarModule.sendEventFromJS();
  }

  return (
    <View>
      <Button
        title="Click to invoke your native module!"
        onPress={onPress}
      />
      <View style={{margin: 10}} />
      <Button
        title="Send an event"
        onPress={sendEvent}
        color="purple"
      />
    </View>
  );
};

export default NewModuleButton;
