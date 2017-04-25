//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Swapnil Tamrakar on 4/6/17.
//  Copyright © 2017 Swapnil Tamrakar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func headerButtonClick(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
