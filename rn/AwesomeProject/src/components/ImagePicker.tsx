import {View, Text, Button} from 'react-native';
import React from 'react';
import ImagePickerModule from '../modules/ImagePickerModule';

const ImagePicker = () => {
  const pickImage = async () => {
    const url = await ImagePickerModule.pickImage();
    console.log({ url });
  };
  return (
    <View style={{margin:10}}>
      <Button title="Pick an Image!" onPress={pickImage} color="green" />
    </View>
  );
};

export default ImagePicker;
