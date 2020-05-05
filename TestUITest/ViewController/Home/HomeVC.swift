//
//  HomeVC.swift
//  TestUITest
//
//  Created by Mac on 5/5/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    var introLb = UILabel()
    var moreInfoBtn = UIButton()
    var tableView = UITableView()
    
    var arr:[String] = ["Manage Team", "Manage Roster", "View Schedule"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

}

extension HomeVC {
    func setUpUI() {
        view.backgroundColor = .white
        
        view.addSubview(introLb)
        introLb.text = "Set your team details, reoder your roster, and view your upcoming games."
        introLb.textColor = .black
        introLb.numberOfLines = .max
        introLb.font = UIFont.systemFont(ofSize: 25)
        introLb.textAlignment = .center
        
        introLb.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalToSuperview().dividedBy(5)
        }
        
        view.addSubview(moreInfoBtn)
        moreInfoBtn.setTitleColor(.systemBlue , for: .normal)
        moreInfoBtn.setTitle("More info", for: .normal)
        
        moreInfoBtn.snp.makeConstraints { make in
            make.left.right.equalTo(introLb)
            make.height.equalTo(30)
            make.top.equalTo(introLb.snp.bottom).offset(5)
        }
        
        view.addSubview(tableView)
        tableView.register(HomeListCell.self, forCellReuseIdentifier: HomeListCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(moreInfoBtn.snp.bottom).offset(10)
            make.right.left.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3)
        }
    }
}

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeListCell.identifier, for: indexPath) as! HomeListCell
        cell.loadData(data: arr[indexPath.row])
        return cell
    }
    
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let controller = ManageTeamVC()
            self.navigationController?.pushViewController(controller, animated: true)
        case 1:
            return
        default:
            return
        }
    }
}
