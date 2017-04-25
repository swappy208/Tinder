//
//  CardsViewController.swift
//  Tinder
//
//  Created by Swapnil Tamrakar on 4/6/17.
//  Copyright © 2017 Swapnil Tamrakar. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    var holdDefaultPosition: CGPoint!
    @IBOutlet var gestureRecognizer: AnyObject!
    //@IBOutlet weak var userImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(panGestureRecognizer)
        cardInitialCenter = userImageView.center
        holdDefaultPosition = userImageView.center

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var userImageView: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            print("Gesture began")
            
        } else if sender.state == .changed {
            
            userImageView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 8) * (translation.x * 0.01))
            
            userImageView.center.x = cardInitialCenter.x + translation.x
            userImageView.center.y = cardInitialCenter.y + translation.y
            
            
            
            print("Gesture is changing")
            
        } else if sender.state == .ended {
            
            if translation.x > 100{
                print("Gone right")
                UIView.animate(withDuration:1, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.userImageView.center.x = 1000
                })
                
            }
                
            else if translation.x < -100{
                print("gone left")
                UIView.animate(withDuration:1, animations: {
                    self.userImageView.center.x = -1000
                })
                
            }
            else{
                UIView.animate(withDuration:1, animations: {
                    self.userImageView.transform = CGAffineTransform.identity
                    self.userImageView.center.x = self.holdDefaultPosition.x
                    self.userImageView.center.y = self.holdDefaultPosition.y
                })
            }
            print("Gesture ended")
        }
    }
    
    
    // MARKs: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVC = segue.destination as! ProfileViewController
        print("Segue called")
        //destinationVC.userImageView = userImageView
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
