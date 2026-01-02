import { requireNativeView } from 'expo';
import * as React from 'react';

import { ExpoPrivacySensitiveViewProps } from './ExpoPrivacySensitive.types';

const NativeView: React.ComponentType<ExpoPrivacySensitiveViewProps> =
  requireNativeView('ExpoPrivacySensitive');

export default function ExpoPrivacySensitiveView(props: ExpoPrivacySensitiveViewProps) {
  return <NativeView {...props} />;
}
