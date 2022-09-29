//  PlayerViewController.swift
//  Example Swift
//
//  Created by Mehdi on 9. 2. 2022.

import UIKit
import Flowplayer

class PlayerController: UIViewController  {
	
	// - IBOutlets
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var mediaLabel: UILabel!
	
	// - Views
	private lazy var videoController = FPFlowplayerViewController()
	
	// - Props
	var mediaName: String?
	var media: FPMedia?
	var plugins: [String]?
	var useCustomWebControls = false
	
	// - Lifecycle
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		mediaLabel.text = mediaName
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		// Create and add config
		let config = createConfig()
		videoController.setControlConfig(config)
		
		// - Add video player to view
		containerView.addSubview(videoController.view)

		// Add the delegate after the flowplayerViewController has been added to the container.
		videoController.addPlayerDelegate(self)
		
		// Prepare media to play
		if let flowplayerMedia = media as? FPFlowplayerMedia {
			videoController.prepare(flowplayerMedia: flowplayerMedia, autoStart: true)
		}
		
		if let externalMedia = media as? FPExternalMedia {
			videoController.prepare(externalMedia: externalMedia, autoStart: true)
		}
	}
}

// MARK: - Private
extension PlayerController {
	
	private func createConfig() -> FPPlayerControlConfig {
		let builder =  FPPlayerControlConfigBuilder()
		builder.setMuteControl(true)
		builder.enablePlugins(plugins!)
		
		if (plugins!.contains("speed")) {
			builder.setCustom(key: "speed.options", value: [0.5, 1, 2, 5])
			builder.setCustom(key: "speed.labels", value: ["Slow", "Normal", "Double", "Fast"])
		}
		
		if (useCustomWebControls) {
			builder.setControlsUrl("https://fp-eu-w1-nnarhinen.s3-eu-west-1.amazonaws.com/sdk-controls/custom.html?token=[TOKEN]&[CONFIG]")
		}
		
		return builder.build()
	}
	
}


// MARK: - FPFlowplayerDelegate
extension PlayerController: FPFlowplayerDelegate {
	
	func onIdle(event: FPIdleEvent) {
		print("onIdle")
	}
	
	func onReady(event: FPReadyEvent) {
		print("onReady")
	}
	
	func onPlay(event: FPPlayEvent) {
		print("onPlay")
	}
	
	func onPause(event: FPPauseEvent) {
		print("onPause")
	}
	
	func onBuffer(event: FPBufferEvent) {
		print("onBuffer")
	}
	
	func onComplete(event: FPCompleteEvent) {
		print("onComplete")
	}
	
	func onFullscreen(event: FPFullscreenEvent) {
		print("onFullscreen")
	}
	
	func onMute(event: FPMuteEvent) {
		print("onMute")
	}
	
	func onVolume(event: FPVolumeEvent) {
		print("onVolume")
	}
	
	func onSpeed(event: FPSpeedEvent) {
		print("onSpeed")
	}
	
	func onAudioTracks(event: FPAudioTracksEvent) {
		print("onAudioTracks")
	}
	
	func onOvpMetadata(event: FPOvpMetadataEvent) {
		print("onOvpMetadata")
	}
	
	func onAudioTrackSelect(event: FPAudioTrackSelectEvent) {
		print("onAudioTrackSelect")
	}
	
	func onError(event: FPErrorEvent) {
		print("onError")
	}
	
	func onAdBreakStart(event: FPAdBreakStartEvent) {
		print("onAdBreakStart")
	}
	
	func onAdBreakComplete(event: FPAdBreakCompleteEvent) {
		print("onAdBreakComplete")
	}
	
	func onAdStart(event: FPAdStartEvent) {
		print("onAdStart")
	}
	
	func onAdPause(event: FPAdPauseEvent) {
		print("onAdPause")
	}
	
	func onAdResume(event: FPAdResumeEvent) {
		print("onAdResume")
	}
	
	func onAdClick(event: FPAdClickEvent) {
		print("onAdClick")
	}
	
	func onAdSkip(event: FPAdSkipEvent) {
		print("onAdSkip")
	}
	
	func onAdComplete(event: FPAdCompleteEvent) {
		print("onAdComplete")
	}
	
	func onAdError(event: FPAdErrorEvent) {
		print("onAdError")
	}
	
	func onSubtitleTrackSelect(event: FPSubtitleTrackSelectEvent) {
		print("onSubtitleTrackSelect")
	}
	
	func onSubtitleTracks(event: FPSubtitleTracksEvent) {
		print("onSubtitleTracks")
	}
	
	func onCasting(event: FPCastingEvent) {
		print("onCasting")
	}

}
