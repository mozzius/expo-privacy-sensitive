// Reexport the native module. On web, it will be resolved to ExpoPrivacySensitiveModule.web.ts
// and on native platforms to ExpoPrivacySensitiveModule.ts
export { default } from './ExpoPrivacySensitiveModule';
export { default as ExpoPrivacySensitiveView } from './ExpoPrivacySensitiveView';
export * from  './ExpoPrivacySensitive.types';
