//
//  ResultViewController.swift
//  TipCalculator
//
//  Created by Camilo Cabana on 24/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let resultTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.masksToBounds = true
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.cornerRadius = 10
        tableView.separatorColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ResultsCell")
    }
    
    func setLayout() {
        view.backgroundColor = .cyan
        view.addSubview(resultTableView)
        resultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        resultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        resultTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        resultTableView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath)
        return cell
    }
    
    
}
