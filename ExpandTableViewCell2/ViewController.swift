//
//  ViewController.swift
//  ExpandTableViewCell2
//
//  Created by Daniel Hjärtström on 2020-06-04.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items = [MainModel]()
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.delegate = self
        temp.dataSource = self
        temp.tableFooterView = UIView()
        temp.separatorStyle = .none
        temp.register(BaseExpandableTableViewCell.self, forCellReuseIdentifier: "BaseExpandableTableViewCell")
        temp.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        temp.register(ExtraViewTableViewCell.self, forCellReuseIdentifier: "ExtraViewTableViewCell")
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        temp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        items = [
            MyModel(title: "String", canExpand: false, heights: Heights(compressed: 50.0, expanded: 0)),
            MyModel(title: "String", heights: Heights(compressed: 50.0, expanded: 100.0)),
            MyModel(title: "String", heights: Heights(compressed: 50.0, expanded: 150.0)),
            ExtraModel(title: "Extra", heights: Heights(compressed: 50.0, expanded: 280.0))
        ]
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = items[indexPath.row]
        
        if let model = model as? MyModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaseExpandableTableViewCell", for: indexPath) as? BaseExpandableTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
        }
        
        if let model = model as? ExtraModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraViewTableViewCell", for: indexPath) as? ExtraViewTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = items[indexPath.row]
        return model.isExpanded ? model.heights.expanded : model.heights.compressed
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = items[indexPath.row]
        guard model.canExpand, let cell = tableView.cellForRow(at: indexPath) as? BaseExpandableTableViewCell else { return }
        model.isExpanded.toggle()
        cell.expanded = model.isExpanded
        tableView.update()
    }
    
    
}


extension UITableView {
    func update() {
        self.beginUpdates()
        self.endUpdates()
    }
}
