import * as React from 'react';

import { ExpoPrivacySensitiveViewProps } from './ExpoPrivacySensitive.types';

export default function ExpoPrivacySensitiveView(props: ExpoPrivacySensitiveViewProps) {
  return (
    <div>
      <iframe
        style={{ flex: 1 }}
        src={props.url}
        onLoad={() => props.onLoad({ nativeEvent: { url: props.url } })}
      />
    </div>
  );
}
