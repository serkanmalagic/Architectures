//
//  TodoAddViewController.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import UIKit
import SnapKit

class TodoAddViewController: UIViewController, UITextFieldDelegate  {

    lazy var headerLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Add values to web service"
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Avenir", size: 35)
        return lbl
    }()
    
    lazy var titleLbl : UITextField = {
        let txt = UITextField()
        txt.placeholder = "  enter your title"
        txt.layer.cornerRadius = 7
        txt.layer.borderWidth = 0.2
        txt.layer.borderColor = UIColor.black.cgColor
        txt.delegate = self
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    
    lazy var subTitleLbl : UITextField = {
        let txt = UITextField()
        txt.placeholder = "  enter your subTitle"
        txt.layer.cornerRadius = 7
        txt.layer.borderWidth = 0.2
        txt.layer.borderColor = UIColor.black.cgColor
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    
    lazy var submitBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.backgroundColor = .magenta
        btn.layer.cornerRadius = 7
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Add"
    }
    
    func setUI() {
        
        view.addSubview(headerLbl)
        view.addSubview(titleLbl)
        view.addSubview(subTitleLbl)
        view.addSubview(submitBtn)

        headerLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        titleLbl.snp.makeConstraints { make in
           // make.left.equalToSuperview().offset(16)
           // make.right.equalToSuperview().offset(-16)
            
            // make.top.equalTo(blackView.snp.bottom).offset(20.0)
            // make.right.equalTo(blackView.snp.left).offset(-20.0)
            // make.size.equalTo(CGSize(width: 100, height: 100))
                        
            make.height.equalTo(view).dividedBy(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(headerLbl.snp.bottom).offset(32)
        }
        
        subTitleLbl.snp.makeConstraints { make in
           
            make.height.equalTo(view).dividedBy(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(titleLbl.snp.bottom).offset(16)
        }
        
        submitBtn.snp.makeConstraints { make in
           
            make.height.equalTo(view).dividedBy(15)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(subTitleLbl.snp.bottom).offset(32)
        }
        
        self.hideKeyboardWhenTappedAround()
    }
   

    @objc func done() { // remove @objc for Swift 3

    }
    

}
