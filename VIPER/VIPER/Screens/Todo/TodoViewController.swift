//
//  TodoViewController.swift
//  VIPER
//
//  Created by Serkan Mehmet Malagiç on 4.01.2022.
//

import UIKit
import SnapKit
import SwiftyJSON



class TodoViewController: UIViewController {
        
    // MARK: - Properties
    var presenter: TodoToPresenterProtocol?
    
    let refreshControl = UIRefreshControl()
    
    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .orange
        tableView.layer.cornerRadius = 15
        tableView.layer.borderWidth = 0.5
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
    }
    
    func setUI(){
        
        view.backgroundColor = .systemOrange
        
        view.addSubview(tableView)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)

        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(44)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        presenter?.updateView()
        
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presenter?.updateView()
        refreshControl.endRefreshing()
    }
   
}

extension TodoViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
                
        let todos = presenter?.getTodos()

        cell.textLabel?.text = todos?[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("row count \(presenter?.getTodosCount())")
        return presenter?.getTodosCount() ?? 0
    }
    
}


// MARK: - LiveNewsListPresenterToViewProtocol
extension TodoViewController: TodoPresenterToViewProtocol {

    func showTodos() {
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
