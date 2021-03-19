//
//  DataManager.swift
//  test_site
//
//  Created by User on 18.03.2021.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var productSet: [Products.Item] = []
    var basket: [Products.Item] = []
    
    func loadData() {
        NetManager.getTestData(dataSetName: "items") { (products, error) in
            guard error == nil else { print("\(error!.localizedDescription)"); return }
            guard let productsData = products?.items else { print("Drop data"); return }
            self.productSet = productsData
        }
    }
}
