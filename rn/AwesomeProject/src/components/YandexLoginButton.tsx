import {View, Text, Button} from 'react-native';
import React from 'react';
import YandexLoginModule from '../modules/YandexLoginModule';
import { getUserInfo } from '../utils/getUserInfo';

const YandexLoginButton = () => {
  async function onYandexLogin() {
    try {
      const clientId = await YandexLoginModule.getClientId();
      console.log({ clientId});
      //const data = await YandexLoginModule.login("dasha.box@yandex.ru");

      //console.log("[Yandex Login]", {cliendId, authToken: data.token});
      //const userInfo = await getUserInfo(cliendId, data.token);
      //console.log({ userInfo});
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
