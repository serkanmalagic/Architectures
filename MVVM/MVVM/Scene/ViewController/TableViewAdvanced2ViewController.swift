//
//  TableViewAdvanced2ViewController.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 10.01.2022.
//

import UIKit
import SnapKit

protocol TableViewReloadDelegate : class {
    func updateWebViewHeight(height : CGFloat)
}

class TableViewAdvanced2ViewController: UIViewController, TableViewReloadDelegate{
    
    private var todoViewModel = TodoViewModel()
    private var webViewHeight : CGFloat = 0

    //  MARK: Views
    
    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.register(TableViewAdvanced2TableViewCell.self,
                           forCellReuseIdentifier: TableViewAdvanced2TableViewCell.identifier)
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    
    //  MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
    }
    
    func setUI() {
        
        view.addSubview(tableView)
        
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).dividedBy(1.01)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).dividedBy(1.01)

        }
        
    }
    
    func updateWebViewHeight(height : CGFloat) {
            webViewHeight = height
            tableView.reloadData()
    }

}


extension TableViewAdvanced2ViewController: UITableViewDataSource,
                                            UITableViewDelegate{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewAdvanced2TableViewCell.identifier,
            for: indexPath
        ) as? TableViewAdvanced2TableViewCell else {
            fatalError()
        }

        switch indexPath.row {
        case 0:
            cell.configureWebViewCell()
            cell.delegate = self
        case  1:
            cell.configureCellHeaderLabel()
        case 5, 6, 7:
            cell.configureCellImgView()
        default:
            cell.configureCellTableView()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return webViewHeight
        default:
            return UITableView.automaticDimension
        }
    }
    
}

