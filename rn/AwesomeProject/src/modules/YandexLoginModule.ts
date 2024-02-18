import {NativeModules} from 'react-native';

const {YandexLoginModule} = NativeModules;

interface YandexLoginModule {
    login(email: string): Promise<{token: string; expiresIn: number}>;
}

export default YandexLoginModule as YandexLoginModule;