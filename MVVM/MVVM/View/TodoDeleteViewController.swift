//
//  TodoDeleteViewController.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import UIKit

class TodoDeleteViewController: UIViewController {

    lazy var headerLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Add values to web service"
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Avenir", size: 35)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Delete"
    }
    
    private func setUI(){
        
        view.addSubview(headerLbl)
        
        headerLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
    }

    @objc func done() { // remove @objc for Swift 3

    }
}
