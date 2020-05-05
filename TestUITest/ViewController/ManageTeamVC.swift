//
//  ManageTeamVC.swift
//  TestUITest
//
//  Created by Mac on 5/5/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import SnapKit

class ManageTeamVC: UIViewController {
    
    let attackers = [ "4 attackers", "5 attackers", "6 attackers" ]
    let setters = [ "2 setters", "1 setter" ]
    
    var teamNameLb = UILabel()
    var teamNameTf = UITextField()
    var skillLevelLb = UILabel()
    var sliderValueLabel = UILabel()
    var slider = UISlider()
    var formationLb = UILabel()
    var selectedFormationLabel = UILabel()
    var formationsPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

}

extension ManageTeamVC {

    fileprivate func updatePickerValue() {
        let attackersFormation = attackers[formationsPicker.selectedRow(inComponent: 0)]
        let settersFormation = setters[formationsPicker.selectedRow(inComponent: 1)]
        let formation = "\(attackersFormation), \(settersFormation)"
        selectedFormationLabel.text = formation
    }
    
    @objc func changeVlaue(_ sender: UISlider) {
        sliderValueLabel.text = String(format: "%.0f", slider.value)
    }
}

extension ManageTeamVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? attackers.count : setters.count
    }
}

extension ManageTeamVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? attackers[row] : setters[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updatePickerValue()
    }
}

extension ManageTeamVC: UIPickerViewAccessibilityDelegate {
    func pickerView(_ pickerView: UIPickerView, accessibilityLabelForComponent component: Int) -> String? {
        return component == 0 ? "Attackers Formation" : "Setters Formation"
    }
}

extension ManageTeamVC {
    func setUpUI() {
    
        view.backgroundColor = .white
        
        view.addSubview(teamNameLb)
        teamNameLb.text = "Team Name:"
        teamNameLb.textColor = .black
        teamNameLb.font = UIFont.systemFont(ofSize: 18)
        
        teamNameLb.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        
        view.addSubview(teamNameTf)
        teamNameTf.placeholder = "Team Name"
        teamNameTf.clipsToBounds = true
        teamNameTf.borderStyle = .line
        teamNameTf.layer.cornerRadius = 4
        teamNameTf.layer.borderWidth = 1
        //teamNameTf.layer.borderColor = UIColor.gray as! CGColor
        
        teamNameTf.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(110)
            make.height.equalTo(30)
            make.left.equalTo(teamNameLb.snp.right)
            make.right.equalToSuperview().offset(-20)
        }
        
        view.addSubview(skillLevelLb)
        skillLevelLb.text = "Skill Level:"
        skillLevelLb.textColor = .black
        skillLevelLb.font = UIFont.systemFont(ofSize: 18)
        
        skillLevelLb.snp.makeConstraints { make in
            make.top.equalTo(teamNameTf.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        
        view.addSubview(sliderValueLabel)
        sliderValueLabel.text = "0"
        sliderValueLabel.textAlignment = .right
        sliderValueLabel.textColor = .black
        sliderValueLabel.font = UIFont.systemFont(ofSize: 18)
        
        sliderValueLabel.snp.makeConstraints { make in
            make.top.equalTo(teamNameTf.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        view.addSubview(slider)
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.addTarget(self, action: #selector(ManageTeamVC.changeVlaue(_:)), for: .valueChanged)
        slider.snp.makeConstraints { make in
            make.top.equalTo(skillLevelLb).offset(40)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        view.addSubview(formationsPicker)
        formationsPicker.dataSource = self
        formationsPicker.delegate = self
        formationsPicker.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.right.left.equalToSuperview()
            make.height.equalTo(150)
        }
        
        view.addSubview(formationLb)
        formationLb.text = "Formation:"
        formationLb.textColor = .black
        formationLb.font = UIFont.systemFont(ofSize: 18)
        formationLb.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(120)
            make.height.equalTo(50)
            make.bottom.equalTo(formationsPicker.snp.top).offset(-50)
        }
        
        view.addSubview(selectedFormationLabel)
        selectedFormationLabel.text = "4 attackers, 2 setters"
        selectedFormationLabel.textAlignment = .right
        selectedFormationLabel.textColor = .black
        selectedFormationLabel.font = UIFont.systemFont(ofSize: 18)
        selectedFormationLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.left.equalTo(formationLb.snp.right)
            make.height.equalTo(50)
            make.bottom.equalTo(formationsPicker.snp.top).offset(-50)
        }
    }
}

