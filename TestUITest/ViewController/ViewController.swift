//
//  ViewController.swift
//  TestUITest
//
//  Created by Mac on 3/12/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var userNameTf = UITextField()
    var passwordTf = UITextField()
    var logInBtn = UIButton()
    var testTf = UITextField()
    
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

}

extension ViewController {
    //Action Functions
    @objc final private func onTopLogInButton(sender: UIButton) {
        
        checkInput()
    }
    
    func checkInput() {
        if userNameTf.text == "Khai2504" && passwordTf.text == "123" {
            let controller = HomeVC()
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Wrong Username or Password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}


extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

extension ViewController {
    func setUpUI() {
        view.backgroundColor = .white
        //view.applyGradient(colours: [.red, .yellow])
        view.addSubview(userNameTf)
        userNameTf.clipsToBounds = true
        
//        userNameTf.layer.shadowRadius = 5
//        userNameTf.layer.shadowOffset = CGSize(width: 5, height: 5)
//        userNameTf.layer.shadowOpacity = 0.7
        
        userNameTf.borderStyle = .line
        userNameTf.layer.cornerRadius = 4
        userNameTf.layer.borderWidth = 1
        userNameTf.placeholder = "UserName"
        userNameTf.text = "Khai2504"
        
        userNameTf.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-64)
            make.left.equalToSuperview().offset(64)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(30)
        }
        
        view.addSubview(passwordTf)
        passwordTf.clipsToBounds = true
        passwordTf.borderStyle = .line
        passwordTf.layer.cornerRadius = 4
        passwordTf.layer.borderWidth = 1
        passwordTf.placeholder = "Password"
        passwordTf.text = "123"
        
        passwordTf.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-64)
            make.left.equalToSuperview().offset(64)
            make.height.equalTo(30)
            make.top.equalTo(userNameTf.snp.bottom).offset(30)
        }
        
        view.addSubview(logInBtn)
        logInBtn.setTitle("LogIn", for: .normal)
        logInBtn.setTitleColor(.black, for: .normal)
        
        logInBtn.addTarget(self, action: #selector(onTopLogInButton(sender:)), for: .touchUpInside)
        logInBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTf.snp.bottom).offset(30)
            make.width.equalToSuperview().dividedBy(2)
        }
        
//        view.addSubview(testTf)
//        testTf.borderStyle = .line
//        testTf.placeholder = "UserName"
//        testTf.snp.makeConstraints { make in
//            make.top.equalTo(logInBtn.snp.bottom).offset(40)
//            make.right.left.equalTo(userNameTf)
//            make.height.equalTo(userNameTf)
//        }
    }
}

