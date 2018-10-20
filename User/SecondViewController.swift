//
//  SecondViewController.swift
//  User
//
//  Created by Cristian Lopez on 17/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var User1: UILabel!
    var first : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        User1.text = first

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
