import ExpoModulesCore
import UIKit

class ExpoPrivacySensitiveView: ExpoView {
  private var secureContainer: UIView?
  private var isSettingUp = true

  required init(appContext: AppContext? = nil) {
    super.init(appContext: appContext)

    let secureTextField = UITextField()
    secureTextField.isSecureTextEntry = true
    secureTextField.isUserInteractionEnabled = false

    guard let container = secureTextField.layer.sublayers?.first?.delegate as? UIView else {
      isSettingUp = false
      return
    }

    secureContainer = container
    container.isUserInteractionEnabled = true
    container.clipsToBounds = false
    container.backgroundColor = .clear

    super.addSubview(container)
    isSettingUp = false
  }

  override func addSubview(_ view: UIView) {
    if isSettingUp || view === secureContainer {
      super.addSubview(view)
      return
    }

    if let container = secureContainer {
      container.addSubview(view)
    } else {
      super.addSubview(view)
    }
  }

  override func insertSubview(_ view: UIView, at index: Int) {
    if isSettingUp || view === secureContainer {
      super.insertSubview(view, at: index)
      return
    }

    if let container = secureContainer {
      container.insertSubview(view, at: index)
    } else {
      super.insertSubview(view, at: index)
    }
  }

  override func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) {
    if isSettingUp || view === secureContainer {
      super.insertSubview(view, aboveSubview: siblingSubview)
      return
    }

    if let container = secureContainer {
      container.addSubview(view)
    } else {
      super.insertSubview(view, aboveSubview: siblingSubview)
    }
  }

  override func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView) {
    if isSettingUp || view === secureContainer {
      super.insertSubview(view, belowSubview: siblingSubview)
      return
    }

    if let container = secureContainer {
      container.addSubview(view)
    } else {
      super.insertSubview(view, belowSubview: siblingSubview)
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    secureContainer?.frame = bounds
  }
}
