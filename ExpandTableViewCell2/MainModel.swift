//
//  MainModel.swift
//  ExpandTableViewCell2
//
//  Created by Daniel Hjärtström on 2020-06-05.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class MainModel: NSObject {
    var heights: Heights
    var canExpand: Bool
    var isExpanded: Bool = false
    var title: String
    
    init(title: String, canExpand: Bool = true, heights: Heights) {
        self.title = title
        self.canExpand = canExpand
        self.heights = heights
    }    
}
