//
//  ResultTableViewCell.swift
//  TipCalculator
//
//  Created by Camilo Cabana on 27/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "result"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setLayout()
    }
    
    func setLayout() {
        addSubview(nameLabel)
        addSubview(resultLabel)
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
