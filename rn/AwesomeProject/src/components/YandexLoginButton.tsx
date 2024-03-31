import {View, Text, Button} from 'react-native';
import React from 'react';
import YandexLoginModule from '../modules/YandexLoginModule';
import { getUserInfo } from '../utils/getUserInfo';

const YandexLoginButton = () => {
  async function onYandexLogin() {
    try {
      //const clientId = await YandexLoginModule.getClientId();
      //const data = await YandexLoginModule.login();
      //console.log("[Yandex Login]", {clientId, authToken: data.token});
      const clientId = "0489ca032e3845b98bdf62d55a301679";
      const authToken = "y0_AgAAAAAJ-sYlAAtOFgAAAAEAd5JkAADSNd4hC4JJTqp7zuy1jfPfkJ23Sw"
      const userInfo = await getUserInfo(clientId, authToken);
      console.log({ userInfo});
    } catch (e) {
      console.log('[Yandex Login/Error]', {e});
    }
  }
  return (
    <View style={{margin: 10}}>
      <Button color="orange" title="Yandex Login" onPress={onYandexLogin} />
    </View>
  );
};

export default YandexLoginButton;
