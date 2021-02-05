//
//  CategoryCell.swift
//  mealPlan
//
//  Created by KYUNGTAE KIM on 2021/02/04.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    var recipes: [Recipe] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Configure collectionView
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showRecipes(_ r: [Recipe]) {
        recipes = r
        recipeCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource Method
extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCardCell", for: indexPath) as? RecipeCardCell else { return UICollectionViewCell() }
        
        // Set the recipe to the collection view cell
        cell.recipe = recipes[indexPath.row]
        
        return cell
    }
}

extension CategoryCell: UICollectionViewDelegate {
    
}
