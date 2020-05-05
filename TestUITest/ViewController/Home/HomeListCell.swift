//
//  HomeListCell.swift
//  TestUITest
//
//  Created by Mac on 5/5/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import SnapKit

class HomeListCell: UITableViewCell {
    
    static var identifier = "HomeListCell"
    
    var textLb = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setUpUI()
    }

}

extension HomeListCell {
    func loadData(data: String?) {
        
        textLb.text = data
    }
}

extension HomeListCell {
    func setUpUI() {
        
        addSubview(textLb)
        textLb.textColor = .black
        textLb.font = UIFont.boldSystemFont(ofSize: 18)
        
        textLb.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
