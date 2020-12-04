//
//  SecondReusableView.swift
//  TestReusableViews
//
//  Created by Julio Collado on 11/27/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

@IBDesignable
class SecondReusableView: UIView {

    @IBOutlet weak var centeredView: UIView! {
        didSet {
            centeredView.backgroundColor = .red
        }
    }
    
    @IBInspectable
    var redSquareCorners: Int = 0 {
        didSet {
            centeredView.layer.cornerRadius = CGFloat(redSquareCorners)
        }
    }
    
    @IBInspectable
    var isOn: Bool = true {
        didSet {
            if isOn {
                self.centeredView.alpha = 1
            } else {
                self.centeredView.alpha = 0
            }
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        //commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        guard let viewFromXib = self.loadViewFromNib(nibName: "SecondReusableView") else { return }
        viewFromXib.frame = self.bounds
        viewFromXib.backgroundColor = .green
        addSubview(viewFromXib)
    }
    
    func setup(color: UIColor) {
        centeredView.backgroundColor = color
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.isOn = !self.isOn
        }, completion: nil)
    }
}

extension UIView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
