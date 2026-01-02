# expo-privacy-sensitive

Hide sensitive content from screenshots and screen recordings on iOS.

## Installation

```bash
npx expo install expo-privacy-sensitive
```

## Usage

```tsx
import { PrivacySensitive } from 'expo-privacy-sensitive';

export default function App() {
  return (
    <View>
      <Text>This is visible in screenshots</Text>

      <PrivacySensitive>
        <Text>This is hidden in screenshots!</Text>
        <Text>Card: 1234 5678 9012 3456</Text>
      </PrivacySensitive>
    </View>
  );
}
```

## API

### `<PrivacySensitive>`

A wrapper component that hides its children from screenshots and screen recordings.

#### Props

| Prop | Type | Description |
|------|------|-------------|
| `children` | `ReactNode` | Content to protect from screenshots |
| `style` | `ViewStyle` | Optional style for the container |

## Platform Support

| Platform | Support |
|----------|---------|
| iOS | ✅ Full support |
| Android | ⚠️ Renders children normally (no protection) |
| Web | ⚠️ Renders children normally (no protection) |

## How it works

On iOS, this library uses a technique involving `UITextField` with `isSecureTextEntry` enabled. The secure text field creates an internal view (`_UITextLayoutCanvasView`) that iOS automatically excludes from screenshots and screen recordings. By placing content inside this view, we inherit the same protection.

## Requirements

- Expo SDK 51+
- iOS 15.1+
- Works with both old and new React Native architecture (Fabric)

## License

MIT
