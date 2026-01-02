import { requireNativeView } from 'expo';
import * as React from 'react';

import { PrivacySensitiveProps } from './ExpoPrivacySensitive.types';

const NativeView: React.ComponentType<PrivacySensitiveProps> =
  requireNativeView('ExpoPrivacySensitive');

export default function PrivacySensitive({ children, style }: PrivacySensitiveProps) {
  return <NativeView style={style}>{children}</NativeView>;
}
