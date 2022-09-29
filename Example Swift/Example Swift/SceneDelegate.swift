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
		let topController = window?.getTopViewController() as? PlayerController
		savedPlayerInstance = topController?.videoController.avPlayer

		// Only continue if playback was present before
		guard savedPlayerInstance?.timeControlStatus != .playing else {
			savedPlayerInstance = nil
			return
		}

		// Continue playback in the background
		topController?.videoController.avPlayer = nil

		// FIXME: Action should be the one that was in enter background
		savedPlayerInstance?.play()
	}


	func sceneWillEnterForeground(_ scene: UIScene) {
		guard (savedPlayerInstance != nil) else { return }
		// Continue Foreground playback if there was a saved player instance
		let topController = window?.getTopViewController() as? PlayerController

		topController?.videoController.avPlayer = self.savedPlayerInstance // Reconnect
		self.savedPlayerInstance = nil

		topController?.videoController.play()
	}

}
