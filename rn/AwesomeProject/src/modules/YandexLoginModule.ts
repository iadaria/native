import {NativeModules} from 'react-native';

const {YandexLoginModule} = NativeModules;

interface YandexLoginModule {
    login(): Promise<{token: string; expiresIn: number}>;
    getClientId(): Promise<string>;
}

export default YandexLoginModule as YandexLoginModule;