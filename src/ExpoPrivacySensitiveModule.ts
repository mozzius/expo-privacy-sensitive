import { NativeModule, requireNativeModule } from 'expo';

import { ExpoPrivacySensitiveModuleEvents } from './ExpoPrivacySensitive.types';

declare class ExpoPrivacySensitiveModule extends NativeModule<ExpoPrivacySensitiveModuleEvents> {
  PI: number;
  hello(): string;
  setValueAsync(value: string): Promise<void>;
}

// This call loads the native module object from the JSI.
export default requireNativeModule<ExpoPrivacySensitiveModule>('ExpoPrivacySensitive');
