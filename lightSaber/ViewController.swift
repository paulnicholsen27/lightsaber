//
//  ViewController.swift
//  lightSaber
//
//  Created by Paul Nichols on 3/2/16.
//  Copyright © 2016 Paul Nicholsen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    var timer = NSTimer()
    var counter = 1
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saberOnPath = NSBundle.mainBundle().pathForResource("coolsaber", ofType: ".wav")
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(string: saberOnPath!)!)
        } catch let error as NSError {
            print(error)
        }
        player.play()
        timer = NSTimer.scheduledTimerWithTimeInterval(
            0.1,
            target: self,
            selector: "initialAnimation",
            userInfo: nil,
            repeats: true)
    }

    func initialAnimation() {
        if counter == 10 {
            timer.invalidate()
        } else {
            var nextImage = "saber\(counter).png"
            mainImage.image = UIImage(named: nextImage)
            counter++
            
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if event.subtype == UIEventSubtype.MotionShake {
            playSound()
        }
    }
    func playSound() {
        let random = Int(arc4random_uniform(5) + 1)
        print(random)
        let saberOnPath = NSBundle.mainBundle().pathForResource("swing\(random)", ofType: ".wav")
        print(saberOnPath)
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(string: saberOnPath!)!)
        } catch let error as NSError {
            print(error)
        }
        player.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

