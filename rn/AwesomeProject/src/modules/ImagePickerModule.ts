import { NativeModules } from 'react-native'

const {ImagePickerModule} = NativeModules;

interface ImagePickerModule {
  pickImage(): Promise<string>;
}

export default ImagePickerModule as ImagePickerModule;