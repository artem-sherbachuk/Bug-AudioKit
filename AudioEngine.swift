//
//  AudioEngine.swift
//  Bug AudioKit
//
//  Created by Artem Sherbachuk on 1/8/22.
//

import AudioKit
import Foundation

final class AudioEngine {

    private let engine = AudioKit.AudioEngine()

    let mixer: Mixer

    let player = AudioPlayer()

    init() {
        mixer = Mixer()
        mixer.addInput(player)
        engine.output = mixer

        do {
            try AudioKit.Settings.setSession(category:.playAndRecord,
                                             with: [.allowBluetoothA2DP,
                                                    .allowAirPlay])

            try engine.start()
        } catch let error {
            print("AudioEngine Error:\(error)")
        }
    }

    func playSound(url: URL) {
        do {
            try player.load(url: url)
        } catch let error {
            print(error)
        }

        player.isLooping = true
        player.play()
    }

    func stop() {
        player.stop()
    }
}
