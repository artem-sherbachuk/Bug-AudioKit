//
//  ViewController.swift
//  Bug AudioKit
//
//  Created by Artem Sherbachuk on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    let audioEngine = AudioEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func play(sender: UIButton) {
        let url = Bundle.main.url(forResource: "fan_default", withExtension: "mp3")!
        audioEngine.playSound(url: url)
    }

}

