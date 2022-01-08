//
//  TableViewAdvancedTableViewCell1.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 8.01.2022.
//

import UIKit
import SnapKit
import WebKit

protocol TableViewAdvancedTableViewCellDelegate {
    func reloadTableView()
}

class TableViewAdvancedTableViewCell : UITableViewCell {
    
    var tableViewAdvancedTableViewCellDelegate : TableViewAdvancedTableViewCellDelegate?

    lazy var textLbl : UILabel = {
       let lbl = UILabel()
        lbl.text = Lorem.paragraph
        lbl.font = UIFont(name: "Helvetica", size: 15)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var img : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "home")
        return img
    }()
    
    lazy var webView : WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellDetail")
        tableView.backgroundColor = .lightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 15
        tableView.layer.borderWidth = 0.5
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set_tableView () {
        
        contentView.addSubview(tableView)
       
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(100)
        }
        
        tableViewAdvancedTableViewCellDelegate?.reloadTableView()
        
    }
    
    func set_webView(){
        
        contentView.addSubview(webView)

        let url = URL(string: "https://www.youtube.com/watch?v=695PN9xaEhs")
            webView.load(URLRequest(url: url!))

        webView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        tableViewAdvancedTableViewCellDelegate?.reloadTableView()

    }
    
    func setUp_Img_textLbl() {
        
        contentView.addSubview(img)
        contentView.addSubview(textLbl)
        
        self.selectionStyle = .none

        img.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        textLbl.snp.makeConstraints { make in
            make.left.equalTo(img.snp.right).multipliedBy(1.20)
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension TableViewAdvancedTableViewCell : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail")!
            
        cell.textLabel?.text = Lorem.sentence
        cell.textLabel?.numberOfLines = 0
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}
