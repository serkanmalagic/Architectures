//
//  ViewController.swift
//  MVP
//
//  Created by Serkan Mehmet Malagiç on 3.01.2022.
//

import UIKit
import SnapKit

class TodoViewController: UIViewController {
    
    lazy var todoPresenter = TodoPresenter(with: self)
    var todos = [Todo]()
    
    let refreshControl = UIRefreshControl()

    
    @objc lazy var tapMeButton : UIButton = {
        let button = UIButton()
        button.setTitle("Tap me and update MVP", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 7
        return button
    }()
    
    lazy var lbl : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .orange
        label.font = UIFont(name: "Helvetica", size: 25)
        label.text = "Lorem ipsum"
        label.numberOfLines = 0
        return label
    }()
    
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
        
        todoPresenter.callTodos(vc : self)

    }
    
    func setUI(){
        
        view.addSubview(tableView)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)

        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(44)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-32)

        }
        
    }
    
    @objc func refresh(_ sender: AnyObject) {
        todoPresenter.callTodos(vc : self)
        refreshControl.endRefreshing()
    }
    
}

extension TodoViewController: TodoPresenterView {
    
    //  Update UI as requested
    func callTodos( model : [Todo]? ) {
        self.todos = model!
        tableView.reloadData()
        print("tapped")
    }
    
}

extension TodoViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let item = todos[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
}
