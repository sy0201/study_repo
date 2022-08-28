//
//  ViewController.swift
//  project01
//
//  Created by siyeon park on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hello()
    }

    func hello() {
        tvHello.text = "Hello,Swift"
        tvHello.textColor = .magenta
        tvHello.font = .systemFont(ofSize: 20)
    }
}

