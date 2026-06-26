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

#if RCT_NEW_ARCH_ENABLED
  // On the new architecture (Fabric), `ExpoView` is an `RCTViewComponentView`
  // subclass and React children are mounted/unmounted via these methods rather
  // than `addSubview`/`insertSubview`. We reparent the children into the secure
  // container here so they stay hidden in screenshots. Crucially, unmount must
  // not fall through to `super`, whose assertion requires the child to be a
  // direct subview of `self`; ours live inside `secureContainer`, so unmounting
  // that way would crash with "Attempt to unmount a view which is mounted inside
  // different view".
  override func mountChildComponentView(_ childComponentView: UIView, index: Int) {
    if let container = secureContainer {
      container.insertSubview(childComponentView, at: index)
    } else {
      super.mountChildComponentView(childComponentView, index: index)
    }
  }

  override func unmountChildComponentView(_ childComponentView: UIView, index: Int) {
    if secureContainer != nil {
      childComponentView.removeFromSuperview()
    } else {
      super.unmountChildComponentView(childComponentView, index: index)
    }
  }
#else
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
#endif

  override func layoutSubviews() {
    super.layoutSubviews()
    secureContainer?.frame = bounds
  }
}
