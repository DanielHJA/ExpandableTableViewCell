//
//  BaseExpandableTableViewCell.swift
//  ExpandTableViewCell2
//
//  Created by Daniel Hjärtström on 2020-06-04.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class BaseExpandableTableViewCell: UITableViewCell {
    
    var expanded: Bool = false {
        didSet {
            separator.alpha = expanded ? 0 : 1
            backgroundColor = expanded ? .lightGray : .white
        }
    }
    
    private(set) lazy var content: UIView = {
        let temp = UIView()
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0).isActive = true
        temp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12.0).isActive = true
        temp.topAnchor.constraint(equalTo: topAnchor, constant: 12.0).isActive = true
        temp.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12.0).isActive = true
        return temp
    }()
    
    private(set) lazy var label: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.black
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: content.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: content.trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: content.topAnchor).isActive = true
        return temp
    }()
    
    private(set) lazy var separator: UIView = {
        let temp = UIView()
        temp.backgroundColor = .gray
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        temp.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        return temp
    }()

    func configure(model: MainModel) {
        label.text = model.title
        separator.isHidden = false
        expanded = model.isExpanded
    }
    
}
