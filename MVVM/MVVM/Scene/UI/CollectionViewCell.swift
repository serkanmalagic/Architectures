//
//  CollectionViewCell.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 17.01.2022.
//

import UIKit
import WebKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    lazy var view : UIView = {
       let view = UIView()
        view.backgroundColor = .magenta
        view.layer.cornerRadius = 15
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    lazy var label : UILabel = {
        let lbl = UILabel()
        lbl.text = "Add values to web service"
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Avenir", size: 35)
        return lbl
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }


    required init ( coder : NSCoder  ) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        view.removeFromSuperview()
    }
    
   
    func configureLabel () {
        
        contentView.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
    }
    
    func configureCell (  ) {
        
        contentView.addSubview(view)
                
        view.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func configureWebViewCell () {
        
        configureCell()
        
        var request = URLRequest(url: URL(string: "https://www.google.com")!)
        request.cachePolicy = .returnCacheDataDontLoad
        webView.load(request)
        
        view.addSubview(webView)
       
        webView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().offset(-2)
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
        }
        
    }
    
}

extension CollectionViewCell: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
    }

}
