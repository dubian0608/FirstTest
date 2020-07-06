//
//  RoomViewController.swift
//  FirstTest
//
//  Created by Zhang Ji on 2020/4/16.
//  Copyright © 2020 Zhang Ji. All rights reserved.
//

import UIKit
import Foundation
import ReplayKit

class RoomViewController: UIViewController {
    @IBOutlet weak var localView: UIView!
    @IBOutlet weak var remoteView: UIView!
    
    var roomId: String!
    var uid: String!
    var mediaEngine: ThunderEngine!
    var audioFilePlayer: ThunderAudioFilePlayer!
    
    var comsumer: ThunderVideoFrameConsumer?
    
    lazy var screenRecord: YXReplayManager = {
        return YXReplayManager()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadEngine()
    }
    
    deinit {
        print("========================================== deinit")
    }
    
    func loadEngine() {
        mediaEngine = ThunderEngine.createEngine(KeyCenter.AppId, sceneId: 0, delegate: self)
        mediaEngine.setArea(.THUNDER_AREA_DEFAULT)

        let config = ThunderVideoEncoderConfiguration()
        config.playType = .init(2)
        config.publishMode = 1

        mediaEngine.setVideoEncoderConfig(config)
        
        let code = mediaEngine.joinRoom(nil, roomName: roomId, uid: uid)
        if code != 0 {
            print("Join room failed")
        }

        setLocalView()

    }
    
    func setAudioPlayer() {
        self.audioFilePlayer = mediaEngine.createAudioFilePlayer()
        audioFilePlayer.setPlayerDelegate(self)
        audioFilePlayer.enablePublish(true)
        audioFilePlayer.enableVolumeIndication(true, interval: 500)
        
        guard let path = Bundle.main.path(forResource: "music1931", ofType: "mp3") else { return }
        
        audioFilePlayer.open(path)
        audioFilePlayer.enablePublish(true)
        audioFilePlayer.play()
        
    }
    
    @IBAction func doRecordPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            mediaEngine.setCustomVideoSource(self.screenRecord)
        } else {
            mediaEngine.setCustomVideoSource(nil)
        }
    }
    
    func setLocalView() {
        let canvas = ThunderVideoCanvas()
        canvas.renderMode = .THUNDER_RENDER_MODE_ASPECT_FIT
        canvas.view = self.localView
        self.localView.backgroundColor = UIColor.black
        mediaEngine.setLocalVideoCanvas(canvas)
        
        mediaEngine.startVideoPreview()
    }
    
    func setRemoteView(uid: String) {
        let canvas = ThunderVideoCanvas()
        canvas.renderMode = .THUNDER_RENDER_MODE_ASPECT_FIT
        canvas.uid = uid
        canvas.view = self.remoteView
        mediaEngine.setRemoteVideoCanvas(canvas)
    }
    
    @IBAction func doLeavePressed(_ sender: UIButton) {
        self.leaveRoon()
        self.navigationController?.popViewController(animated: true)
    }
    
    func leaveRoon() {
        DispatchQueue.global().async {
            self.mediaEngine.stopVideoPreview()
        }
        
        mediaEngine.setLocalVideoCanvas(nil)
        self.mediaEngine.stopVideoPreview()
        
        mediaEngine.leaveRoom()
    }
}

extension RoomViewController: ThunderAudioFilePlayerDelegate {
    
}

extension RoomViewController: ThunderEventDelegate {
    func thunderEngine(_ engine: ThunderEngine, onRemoteAudioStateChangedOfUid uid: String, state: ThunderRemoteAudioState, reason: ThunderRemoteAudioReason, elapsed: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onLocalAudioStatusChanged status: ThunderLocalAudioStreamStatus, errorReason: ThunderLocalAudioStreamErrorReason) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRemoteVideoStateChangedOfUid uid: String, state: ThunderRemoteVideoState, reason: ThunderRemoteVideoReason, elapsed: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onLocalVideoStatusChanged status: ThunderLocalVideoStreamStatus, error: ThunderLocalVideoStreamErrorReason) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, on stats: ThunderRtcLocalDeviceStats) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, sdkAuthResult: ThunderRtcSdkAuthResult) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onJoinRoomSuccess room: String, withUid uid: String, elapsed: Int) {
        print("Join room success with \(uid)")
        mediaEngine.stopAllRemoteVideoStreams(false)
        mediaEngine.stopAllRemoteAudioStreams(false)
        
//        mediaEngine.enableLocalVideoCapture(true)
        mediaEngine.stopLocalVideoStream(false)
        mediaEngine.stopLocalAudioStream(false)
    }
    
    func thunderEngine(_ engine: ThunderEngine, onLeaveRoomWith stats: ThunderRtcRoomStats) {
        
    }
    
    
    func thunderEngine(_ engine: ThunderEngine, bPublish: Bool, bizAuthResult: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onPlayVolumeIndication speakers: [ThunderRtcAudioVolumeInfo], totalVolume: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onCaptureVolumeIndication totalVolume: Int, cpt: UInt, micVolume: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onAudioPlayData uid: String, duration: UInt, cpt: UInt, pts: UInt, data: Data?) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onAudioPlaySpectrumData data: Data?) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onAudioCapturePcmData data: Data?, sampleRate: UInt, channel: UInt) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onAudioRenderPcmData data: Data?, duration: UInt, sampleRate: UInt, channel: UInt) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRecvUserAppMsgData msgData: Data, uid: String) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onSendAppMsgDataFailedStatus status: UInt) {
            
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRemoteAudioStopped stopped: Bool, byUid uid: String) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRemoteVideoStopped stopped: Bool, byUid uid: String) {
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.setRemoteView(uid: uid)
        }
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRemoteVideoPlay uid: String, size: CGSize, elapsed: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onVideoSizeChangedOfUid uid: String, size: CGSize, rotation: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, on status: ThunderVideoCaptureStatus) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, on status: ThunderConnectionStatus) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, on stats: RoomStats) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onFirstLocalAudioFrameSent elapsed: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onFirstLocalVideoFrameSent elapsed: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            self.doLeavePressed(UIButton())
        }
    }
    
    func thunderEngine(_ engine: ThunderEngine, onPublishStreamToCDNStatusWithUrl url: String, errorCode: ThunderPublishCDNErrorCode) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onNetworkTypeChanged type: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, on stats: ThunderRtcLocalVideoStats) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, on stats: ThunderRtcLocalAudioStats) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onAudioCaptureStatus status: Int) {
        
    }
    
    func thunderEngineConnectionLost(_ engine: ThunderEngine) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onTokenWillExpire token: String) {
        
    }
    
    func thunderEngineTokenRequest(_ engine: ThunderEngine) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onUserBanned status: Bool) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRemoteAudioPlay uid: String, elapsed: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onUserJoined uid: String, elapsed: Int) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onUserOffline uid: String, reason: ThunderLiveRtcUserOfflineReason) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onNetworkQuality uid: String, txQuality: ThunderLiveRtcNetworkQuality, rxQuality: ThunderLiveRtcNetworkQuality) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRemoteVideoStatsOfUid uid: String, stats: ThunderRtcRemoteVideoStats) {
        
    }
    
    func thunderEngine(_ engine: ThunderEngine, onRemoteAudioStatsOfUid uid: String, stats: ThunderRtcRemoteAudioStats) {
        
    }
}
