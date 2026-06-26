import { View } from "react-native";

import { type PrivacySensitiveProps } from "./ExpoPrivacySensitive.types";

// Non-iOS fallback: just render children directly
export default function PrivacySensitive({
  children,
  style,
}: PrivacySensitiveProps) {
  return <View style={style}>{children}</View>;
}
