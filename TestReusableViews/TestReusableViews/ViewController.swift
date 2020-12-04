//
//  ViewController.swift
//  TestReusableViews
//
//  Created by Julio Collado on 11/27/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var second: SecondReusableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.second.setup(color: .black)
        }
        
        
        //View being shown on the TOP
        
        let another = SecondReusableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300))
        self.view.addSubview(another)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            another.setup(color: .black)
        }
    }
    
}

