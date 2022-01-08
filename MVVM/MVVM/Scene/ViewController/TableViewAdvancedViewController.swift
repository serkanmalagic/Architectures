//
//  TableViewAdvancedViewController.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 8.01.2022.
//

import UIKit


class TableViewAdvancedViewController: UIViewController, TableViewAdvancedTableViewCellDelegate {
    
    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.register(TableViewAdvancedTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .lightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 15
        tableView.layer.borderWidth = 0.5
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Fetch"
    }
    
    func setUI () {
        

        navigationController?.navigationBar.topItem?.title = "Fetch"
        
        view.addSubview(tableView)
       
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).dividedBy(1.01)
        }
        
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }

}


extension TableViewAdvancedViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewAdvancedTableViewCell

        if indexPath.row == 1 {
            cell.setUp_Img_textLbl()
        }else if indexPath.row == 0 {
            cell.set_webView()
        }else if indexPath.row == 2 {
            cell.set_tableView()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
}

