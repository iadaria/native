import {NativeModules} from 'react-native';

const {YandexLoginModule} = NativeModules;

interface YandexLoginModule {
    login(email: string): Promise<object>;
}

export default YandexLoginModule as YandexLoginModule;