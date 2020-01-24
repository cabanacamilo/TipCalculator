//
//  TipButton.swift
//  TipCalculator
//
//  Created by Camilo Cabana on 24/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class TipButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
