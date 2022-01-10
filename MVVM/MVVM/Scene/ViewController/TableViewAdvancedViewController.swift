//
//  TableViewAdvancedViewController.swift
//  MVVM
//
//  Created by Serkan Mehmet Malagiç on 8.01.2022.
//

import UIKit

//  What product page detail includes
enum SectionType {
    case productPhotos(images : [UIImage])
    case productInfo (viewModel : TableViewAdvancedViewModel)
    case relatedProducts
    
    var title: String? {
        switch self {
        case .relatedProducts:
            return "Related Products"
        default:
            return nil
        }
    }
}

class TableViewAdvancedViewController: UIViewController {
    
    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(PhotoCarosuelTableViewCell.self,
                           forCellReuseIdentifier: PhotoCarosuelTableViewCell.identifier)
        
        tableView.register(RelatedProductTableViewCell.self,
                           forCellReuseIdentifier: RelatedProductTableViewCell.identifier)
        
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 15
        tableView.layer.borderWidth = 0.5
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    var tableViewAdvanvedViewModel = TableViewAdvancedViewModel()
    private var sections = [SectionType]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSections()
        setUI()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Fetch"
    }
    
    func setSections () {
        
        sections.append(.productPhotos(images: [
            UIImage(named: "huawei"),
            UIImage(named: "huawei"),
            UIImage(named: "huawei")
        ].compactMap({$0})))
        
        tableViewAdvanvedViewModel.products.append(Product(name: "iPhone", price: "700$", description: "Best smartphone we have ever made", extra: "no extra just expensive"))
            
        sections.append(.productInfo(viewModel: tableViewAdvanvedViewModel))
       
        
        
        sections.append(.relatedProducts)

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
        
        tableView.reloadData()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }

}


extension TableViewAdvancedViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let sectionType = sections[indexPath.section]
        
        switch sectionType {
        case .productPhotos(let images):
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PhotoCarosuelTableViewCell.identifier,
                for: indexPath
            ) as? PhotoCarosuelTableViewCell else {
                fatalError()
            }

            cell.configure(with: images)
            
            return cell
            
        case .productInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = Lorem.paragraph + Lorem.paragraph
            cell.textLabel?.numberOfLines = 0
            return cell
        case .relatedProducts:
            
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RelatedProductTableViewCell.identifier,
                for: indexPath
            ) as? RelatedProductTableViewCell else {
                fatalError()
            }

            var productModelTemplate = RelatedProductTableViewCellViewModel(image: UIImage(named: "huawei"), title: Lorem.paragraph)
            
            
            cell.configure(with: productModelTemplate)
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Lorem"
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        switch sectionType {
        case .productPhotos:
            return 1
        case.productInfo:
            return 1
        case .relatedProducts:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionType = sections[section]
        return sectionType.title

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .productPhotos:
            return view.frame.size.width
        case .relatedProducts:
            return 150
        case .productInfo:
            return UITableView.automaticDimension
        }
        
    }
    
}

