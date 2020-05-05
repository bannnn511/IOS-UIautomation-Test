//
//  HomeCell.swift
//  TestUITest
//
//  Created by Mac on 3/13/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import SnapKit

class HomeCell: UITableViewCell {

    static let identifier = "HomeCell"
    
    var numLb = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}

extension HomeCell {
    func loadData(data: String?) {
        guard let data = data else {
            return
        }
        
        numLb.text = data
    }
}

extension HomeCell {
    func setUpUI() {
        numLb.textColor = .black
        addSubview(numLb)
        numLb.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
}
