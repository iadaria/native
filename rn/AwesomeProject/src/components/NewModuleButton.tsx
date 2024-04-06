import {Button,  View, NativeModules } from 'react-native';
import React from 'react';
import CalendarModule from '../modules/CalendarModule';

//const { DEFAULT_EVENT_NAME } = CalendarModule.getConstants()

const NewModuleButton = () => {
  /* useEffect(() => {
    const eventEmitter = new NativeEventEmitter(NativeModules.CalendarModule);
    let eventListener = eventEmitter.addListener('EventReminder', event => {
      console.log(event.eventProperty);
    })

    return () => { eventListener.remove(); }
  }, []); */

  const onPress = async () => {
    console.log('[RN]We will invoke the native module here!');

    try {
      const eventId = await CalendarModule.createCalendarEvent(
        'Party',
        'my house',
      );
      console.log(`Created a new event with id ${eventId}`);
    } catch (e) {
      console.error(e);
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
