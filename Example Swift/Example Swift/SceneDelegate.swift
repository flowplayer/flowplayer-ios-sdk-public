//
//  SceneDelegate.swift
//  Example Swift
//
//  Created by Mehdi on 29. 9. 2022..
//

import UIKit
import AVFoundation

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	private var savedPlayerInstance: AVPlayer?

	func sceneDidEnterBackground(_ scene: UIScene) {
		//		Uncomment code to enable background playback
		//		guard let topController = window?.getTopViewController() as? PlayerController else {
		//			return
		//		}
		//		savedPlayerInstance = topController.videoController.avPlayer
		//
		//		// Continue playback in the background
		//		topController.videoController.avPlayer = nil
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		//		Uncomment code to enable background playback
		//		guard (savedPlayerInstance != nil) else { return }
		//		// Continue Foreground playback if there was a saved player instance
		//		guard let topController = window?.getTopViewController() as? PlayerController else {
		//			return
		//		}
		//
		//		topController.videoController.avPlayer = self.savedPlayerInstance // Reconnect
		//		self.savedPlayerInstance = nil
	}

}
