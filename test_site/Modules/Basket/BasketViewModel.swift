//
//  BasketViewModel.swift
//  test_site
//
//  Created by User on 18.03.2021.
//

import Foundation

class BasketViewModel {
    private let dm = DataManager.shared
    
    func getCount() -> Int {
        dm.basket.count
    }
    
    func getSum() -> Double {
        dm.basket.reduce(into: 0.0, { $0 += $1.price })
    }
    
    func getProduct(by index: Int) -> Products.Item {
        dm.productSet[index]
    }
}
