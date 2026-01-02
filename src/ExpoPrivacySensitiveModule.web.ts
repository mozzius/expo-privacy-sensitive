import { registerWebModule, NativeModule } from 'expo';

import { ExpoPrivacySensitiveModuleEvents } from './ExpoPrivacySensitive.types';

class ExpoPrivacySensitiveModule extends NativeModule<ExpoPrivacySensitiveModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
}

export default registerWebModule(ExpoPrivacySensitiveModule, 'ExpoPrivacySensitiveModule');
