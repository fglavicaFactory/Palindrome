//
//  ViewController.swift
//  PredavanjeBrojDva
//
//  Created by Filip Glavica on 09/03/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LogoImageView: UIImageView!
    @IBOutlet weak var coolButton: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func coolButtonPressed(_ sender: Any) {
        print("Gombec")
    }
    
}

