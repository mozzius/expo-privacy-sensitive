import ExpoModulesCore

public class ExpoPrivacySensitiveModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoPrivacySensitive")

    View(ExpoPrivacySensitiveView.self) {}
  }
}
