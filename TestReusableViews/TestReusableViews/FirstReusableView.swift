//
//  FirstReusableView.swift
//  TestReusableViews
//
//  Created by Julio Collado on 11/27/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class FirstReusableView: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setTitle(title: String?) {
        titleLabel.text = title
    }

}
