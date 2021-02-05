//
//  RecipeDetailViewController.swift
//  mealPlan
//
//  Created by KYUNGTAE KIM on 2021/02/04.
//

import UIKit

class RecipeDetailViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
        editButton.layer.cornerRadius = 8
    }
    
    
    @IBAction func pageChanged(_ sender: Any) {
        addButton.setTitle("2page", for: .normal)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
