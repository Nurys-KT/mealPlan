//
//  ViewController.swift
//  mealPlan
//
//  Created by KYUNGTAE KIM on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var categoryTableView: UITableView!
    
    let sections = ["Salads", "Seafood", "Steak"]
    var recipeDictionary: [String:[Recipe]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let salads = [Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa"),
                      Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa"),
                      Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa")
                    ]
        recipeDictionary[sections[0]] = salads
        
        let seafood = [Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa"),
                      Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa"),
                      Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa")
                    ]
        recipeDictionary[sections[1]] = seafood
        
        let steak = [Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa"),
                      Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa"),
                      Recipe(recipeName: "Sunny Quinoa Salad", cardImage: "quinoa")
                    ]
        recipeDictionary[sections[2]] = steak
        
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        // Configure Grid Button
        gridButton.layer.borderColor = UIColor.black.cgColor
        gridButton.layer.borderWidth = 1
        gridButton.layer.cornerRadius = 3
        
    }

//    override func viewDidAppear(_ animated: Bool) {
//        let vc = storyboard?.instantiateViewController(identifier: "RecipeDetail") as! RecipeDetailViewController
//        vc.modalPresentationStyle = .overCurrentContext
//
//        present(vc, animated: true, completion: nil)
//    }
}

extension ViewController: UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }

    // table view의 style을 grouped로 했을때, 첫번째 section의 header를 가져오지 않는 버그가 있었음. 이유가 첫번째 헤더에는 높이가 적용되지 않았던것.. 그래서 임의로 이렇게 높이를 지정해준다.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    // customize the section header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Label
        let label = UILabel()
        //제약조건을 프로그래밍으로 할때는 뷰 자체적으로 수행하는 오토리사이징을 꺼야 함(이유 : 사용자가 지정한 오토레이아웃 조건과 충돌하여 제약조건 문제를 일으킴)
        // default constraint와 충돌날 수 있어서 Auto Resizing은 끈다.
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sections[section]
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        
        // Header View
        let headerView = UIView()
        headerView.addSubview(label)

        
        // Add positioning contraints
        let leftContraint = NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: headerView, attribute: .left, multiplier: 1, constant: 20)
        let yCenterConstraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: headerView, attribute: .centerY, multiplier: 1, constant: 0)
        headerView.addConstraints([leftContraint, yCenterConstraint])
        
//        let leftCons = label.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
//        let yCons = label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }

        let sectionName = sections[indexPath.section]
        // Get the recipes for the section requested
        let recipes  = recipeDictionary[sectionName]
        
        if recipes != nil {
            cell.showRecipes(recipes!)
        } 
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

