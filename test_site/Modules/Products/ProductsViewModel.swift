//
//  ProductsViewModel.swift
//  test_site
//
//  Created by User on 18.03.2021.
//

import Foundation

class ProductsViewModel {
    private let dm = DataManager.shared
    
    func getCount() -> Int {
        dm.productSet.count
    }
    
    func addToBasket(with index: Int) {
        dm.basket.append(dm.productSet[index])
    }
    
    func getProduct(by index: Int) -> Products.Item {
        dm.productSet[index]
    }
}
