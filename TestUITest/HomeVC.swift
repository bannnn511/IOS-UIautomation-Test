//
//  HomeVC.swift
//  TestUITest
//
//  Created by Mac on 3/12/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {

    static let identifier = "HomeVC"
    
    var arr = ["101","102","103","104","105"]
    
    var homeLb = UILabel()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "homeVC"
        setUpUI()
    }

}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        cell.loadData(data: arr[indexPath.row])
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeVC {
    func setUpUI() {
        view.backgroundColor = .white
        //view.addSubview(homeLb)
//        homeLb.text = "HOME"
//        homeLb.textColor = .black
//        homeLb.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//        }
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
        tableView.backgroundColor = .gray
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
