//
//  Collection2RowsViewController.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 17.01.2022.
//

import UIKit

class Collection2RowsViewController: UIViewController {

    
    lazy var collectionView : UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        
        let collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Delete"
    }
    
    private func setUI(){
        
        view.addSubview(collectionView)
        
      
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
    }

    @objc func done() { // remove @objc for Swift 3

    }

}

extension Collection2RowsViewController : UICollectionViewDelegate,
                                          UICollectionViewDataSource,
                                          UICollectionViewDelegateFlowLayout{
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as? CollectionViewCell else {
            fatalError()
        }
        
        if indexPath.row == 0 {
            cell.configureLabel()
        }else {
            cell.configureWebViewCell()
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row != 0 {
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.invalidateLayout()
            return CGSize(width: ((self.collectionView.frame.width/2) ), height: ((self.collectionView.frame.width / 2) ))
        }else{
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.invalidateLayout()
            return CGSize(width: ((self.collectionView.frame.width) ), height: ((self.collectionView.frame.width / 3 ) ))
        }
        
    }
}
