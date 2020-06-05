//
//  ExtraViewTableViewCell.swift
//  ExpandTableViewCell2
//
//  Created by Daniel Hjärtström on 2020-06-04.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ExtraViewTableViewCell: BaseExpandableTableViewCell {

    private lazy var someview: UIView = {
        let temp = UIView()
        temp.backgroundColor = .blue
        content.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        temp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        temp.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30.0).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        return temp
    }()
    
    override func configure(model: MainModel) {
        super.configure(model: model)
        clipsToBounds = true
        someview.isHidden = false
    }

}
