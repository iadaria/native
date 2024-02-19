import {View, Text, Button} from 'react-native';
import React from 'react';
import YandexLoginModule from '../modules/YandexLoginModule';

const YandexLoginButton = () => {
  async function onYandexLogin() {
    try {
      const cliendId = await YandexLoginModule.getClientId();
      console.log({cliendId});
      //const data = await YandexLoginModule.login("dasha.box@yandex.ru");
      //console.log("[Yandex Login]", data);
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
