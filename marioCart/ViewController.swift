//
//  ViewController.swift
//  marioCart
//
//  Created by Mark Falcone on 7/15/21.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var kart0: UIImageView!
    @IBOutlet weak var kart1: UIImageView!
    @IBOutlet weak var kart2: UIImageView!
    @IBOutlet weak var kart3: UIImageView!
    @IBOutlet weak var kart4: UIImageView!
    var startingPointKartView0 = CGPoint()
    var startingPointKartView1 = CGPoint()
    var startingPointKartView2 = CGPoint()
    var startingPointKartView3 = CGPoint()
    var startingPointKartView4 = CGPoint()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startingPointKartView0 = kart0.center
        startingPointKartView1 = kart1.center
        startingPointKartView2 = kart2.center
        startingPointKartView3 = kart3.center
        startingPointKartView4 = kart4.center
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
    }


    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
       //get the locarion of users pan in x and y cordnates
        let location = sender.location(in: view)
        print("Location: x: \(location.x), y: \(location.y)")
        // force unwraping the view
        let kartView = sender.view!
        // seting the kart to the location of the users finger
        //kartView.transform = CGAffineTransformMakeScale(1.1,1.1)
        kartView.center = location
    }
    @IBAction func didPintchKartView(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print("scale \(scale)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        print("rotata \(rotation)")
        let kartview = sender.view!
        kartview.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        let kartView = sender.view!
        //kartView.center.x += 50
        UIView.animate(withDuration: 0.8) {
           // Closure body
           kartView.center.x += 50
        }
    }
    
    @IBAction func didLongPress(_ sender: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.6){
            self.kart0.center = self.startingPointKartView0
            self.kart1.center = self.startingPointKartView1
            self.kart2.center = self.startingPointKartView2
            self.kart3.center = self.startingPointKartView3
            self.kart4.center = self.startingPointKartView4
            self.kart0.transform = CGAffineTransform.identity
            self.kart1.transform = CGAffineTransform.identity
            self.kart2.transform = CGAffineTransform.identity
            self.kart3.transform = CGAffineTransform.identity
            self.kart4.transform = CGAffineTransform.identity
            
        }
    }
    
    
}

