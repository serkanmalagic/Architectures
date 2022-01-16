//
//  TableViewAdvanced2TableViewCell.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 13.01.2022.
//

import UIKit
import SnapKit
import WebKit

class TableViewAdvanced2TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewAdvanced2TableViewCell"
    var delegate : TableViewReloadDelegate?
    var webViewIsUpdated : Bool = false
   
    lazy var label : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .brown
        label.backgroundColor = .cyan
        label.text = Lorem.sentence
        label.font = UIFont(name: "Helcetica", size: 15)
        label.layer.cornerRadius = 7
        return label
    }()
    
    lazy var imgView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "huawei")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var headerLabel : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = Lorem.paragraphs(2)
        label.font = UIFont(name: "Helvetica", size: 25)
        return label
    }()
    
    lazy var webView : WKWebView = {
      let myConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: myConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.isScrollEnabled = false
        webView.navigationDelegate = self
        webView.isOpaque = false
        webView.layer.borderWidth = 0.5
        webView.layer.borderColor =  UIColor.darkGray.cgColor
        webView.layer.cornerRadius = 10
        webView.layer.masksToBounds = true
        return webView
    }()
    
    override init ( style : UITableViewCell.CellStyle, reuseIdentifier : String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBackground
       

        
    }

    required init ( coder : NSCoder  ) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        webView.removeFromSuperview()
        label.removeFromSuperview()
        headerLabel.removeFromSuperview()
        imgView.removeFromSuperview()
    }
    
    func configureCellImgView (  ) {
        contentView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(200)
        }
    }
    func configureCellHeaderLabel (  ) {
        contentView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().offset(-2)
            make.bottom.equalToSuperview().offset(-2)
        }
    }
    func configureCellTableView (  ) {
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().offset(-2)
            make.bottom.equalToSuperview().offset(-2)
        }
    }
    func configureWebViewCell () {
        
        var request = URLRequest(url: URL(string: "https://image.shutterstock.com/image-photo/image-260nw-1289685550.jpg")!)
        request.cachePolicy = .returnCacheDataElseLoad
        webView.load(request)
        
        contentView.addSubview(webView)
       
        webView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().offset(-2)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
    }

    
}

extension TableViewAdvanced2TableViewCell: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            if !self.webViewIsUpdated {
                
                let height = self.webView.scrollView.contentSize.height
                
                self.webView.snp.remakeConstraints { make in
                    make.height.equalTo(height)
                }
                
                self.delegate?.updateWebViewHeight(height: height)
                self.webViewIsUpdated = true
                
            }
        }
    }

}
