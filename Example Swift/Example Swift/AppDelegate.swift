//  AppDelegate.swift
//  Example Swift
//
//  Created by Mehdi on 9. 2. 2022.

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	private var savedPlayerInstance: AVPlayer?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

			// Override point for customization after application launch.
			let session = AVAudioSession.sharedInstance()
			do{
				try session.setCategory(.playback, mode: .default, options: [])
				try session.setActive(true)
			} catch{
				print(error.localizedDescription)
			}

			return true
		}

	// This will trigger in iOS 12 or in apps that don't have UISceneDelegate
	func applicationDidEnterBackground(_ application: UIApplication) {
		//		Uncomment code to enable background playback
		//      let topController = window?.getTopViewController() as? PlayerController
		//
		//      savedPlayerInstance = topController?.videoController.avPlayer
		//
		//		// Continue playback in the background
		//      topController?.videoController.avPlayer = nil // Disconnect
	}

	// This will trigger in iOS 12 or in apps that don't have UISceneDelegate
	func applicationWillEnterForeground(_ application: UIApplication) {
		//		Uncomment code to enable background playback
		//		guard (savedPlayerInstance != nil) else { return }
		//
		//		// Continue Foreground playback
		//		let topController = window?.getTopViewController() as? PlayerController
		//
		//		topController?.videoController.avPlayer = self.savedPlayerInstance // Reconnect
		//		self.savedPlayerInstance = nil
	}

}
