//
//  ScheduleViewController.swift
//  TestUITest
//
//  Created by An on 5/5/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import CoreLocation
import SnapKit

class ScheduleViewController: UIViewController {

    private let locationManager = CLLocationManager()
    private var nextGameLabel = UILabel()
    private var locationAuthorizationLabel = UILabel()
    private var game1Label = UILabel()
    private var game2Label = UILabel()
    private var game3Label = UILabel()
    private var statusGame1 = UILabel()
    private var statusGame2 = UILabel()
    private var finishBtn = UIButton()
    private var loadMoreBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        updateLocationAuthorizationStatus()
    }
    

}

extension ScheduleViewController {
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Schedule"
        
        view.addSubview(game1Label)
        game1Label.text = "Game 1 - 25-22"
        game1Label.textColor = .black
        game1Label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(22)
        }
        
        view.addSubview(game2Label)
        game2Label.textColor = .black
        game2Label.text = "Game 2 - 26-24"
        game2Label.snp.makeConstraints { (make) in
            make.top.equalTo(game1Label.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(22)
        }
        
        view.addSubview(game3Label)
        game3Label.textColor = .black
        game3Label.text = "Game 3 - 27-25"
        game3Label.snp.makeConstraints { (make) in
            make.top.equalTo(game2Label.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(22)
        }
        
        view.addSubview(nextGameLabel)
        nextGameLabel.textColor = .black
        nextGameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(game3Label.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(22)
        }
        
        view.addSubview(statusGame1)
        statusGame1.text = "Loss"
        statusGame1.textColor = .black
        statusGame1.snp.makeConstraints { (make) in
            make.centerY.equalTo(game1Label)
            make.right.equalToSuperview().inset(22)
        }
        
        view.addSubview(statusGame2)
        statusGame2.text = "Win"
        statusGame2.textColor = .black
        statusGame2.snp.makeConstraints { (make) in
            make.centerY.equalTo(game2Label)
            make.right.equalToSuperview().inset(22)
        }
        
        view.addSubview(finishBtn)
        finishBtn.setTitle("Finish Game", for: .normal)
        finishBtn.setTitleColor(.systemBlue, for: .normal)
        finishBtn.addTarget(self, action: #selector(finishGameBtnOnClick(_:)), for: .touchUpInside)
        finishBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(game3Label)
            make.right.equalToSuperview().inset(22)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        view.addSubview(loadMoreBtn)
        loadMoreBtn.setTitle("Load More Games", for: .normal)
        loadMoreBtn.setTitleColor(.systemBlue, for: .normal)
        loadMoreBtn.addTarget(self, action: #selector(loadMoreBtnOnClick(_:)), for: .touchUpInside)
        loadMoreBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(game3Label.snp.bottom).offset(32)
        }
    }
    
    @objc private func finishGameBtnOnClick(_ sender: UIButton) {
        let alert = UIAlertController(title: "You won!", message: "Final Score: 27 - 25", preferredStyle: UIAlertController.Style.alert)
        
        let dismissAction = UIAlertAction(title: "Awesome!", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(dismissAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func loadMoreBtnOnClick(_ sender: UIButton) {
        sender.setTitle("Loading...", for: UIControl.State.normal)
        
        sender.perform(#selector(setter: sender.isHidden), with: true, afterDelay: 2)
        nextGameLabel.perform(#selector(setter: nextGameLabel.text), with: "Game 4 - Tomorrow", afterDelay: 2)
    }
    
    fileprivate func updateLocationAuthorizationStatus() {
        var authorizationStatus: String
        switch CLLocationManager.authorizationStatus() {
        case CLAuthorizationStatus.notDetermined:
            authorizationStatus = "Not Determined"
        case CLAuthorizationStatus.denied,
             CLAuthorizationStatus.restricted:
            authorizationStatus = "Denied"
        default:
            authorizationStatus = "Authorized"
        }
        
        locationAuthorizationLabel.text = authorizationStatus
    }
}

extension ScheduleViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        updateLocationAuthorizationStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
