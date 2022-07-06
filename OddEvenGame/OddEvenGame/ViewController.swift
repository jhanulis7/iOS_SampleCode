//
//  ViewController.swift
//  OddEvenGame
//
//  Created by 7012618 on 2022/07/05.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var computerBallCountLvl: UILabel!
    @IBOutlet weak var userBallCountLvl: UILabel!
    
    var comBallCount: Int = 20
    var userBallCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLvl.text = String(comBallCount)
        userBallCountLvl.text = String(userBallCount)
    }


}

