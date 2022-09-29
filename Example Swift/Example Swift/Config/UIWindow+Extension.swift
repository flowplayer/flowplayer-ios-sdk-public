//
//  UIWindow+Extension.swift
//  Example Swift
//
//  Created by Mehdi on 29. 9. 2022..
//

extension UIWindow {

	func getTopViewController(base: UIViewController? = nil) -> UIViewController? {
		let root = base ?? rootViewController

		if let nav = root as? UINavigationController {
			return getTopViewController(base: nav.visibleViewController)

		} else if let tab = root as? UITabBarController, let selected = tab.selectedViewController {
			return getTopViewController(base: selected)

		} else if let presented = root?.presentedViewController {
			return getTopViewController(base: presented)
		}

		return root
	}

}
