import { NativeModules } from 'react-native';

const {CalendarModule } = NativeModules;

interface CalendarModule {
  createCalendarEvent(
    name: string,
    location: string,
    callback?: (error: string, eventId: number) => void,
  ): void;
  createCalendarEvent(
    name: string,
    location: string,
    
    errorCallback?: (eventId: number) => void,
    successCallback?: (error: string) => void,
  ): void;
  createCalendarEvent(name: string, location: string): Promise<number>;
  getConstants(): Constants;
  sendEventFromJS(): void;
}

type Constants = {
    DEFAULT_EVENT_NAME: string;
};

export default CalendarModule as CalendarModule;