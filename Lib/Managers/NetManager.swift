//
//  NetManager.swift
//  test_site
//
//  Created by User on 18.03.2021.
//

import Foundation
import UIKit

class NetManager {
    class func getTestData(dataSetName: String, completion: @escaping (Products.Product?, Error?) -> Void) {
        if let asset = NSDataAsset(name: dataSetName) {
            let data = asset.data
            do {
                let productSet = try JSONDecoder().decode(Products.Product.self, from: data)
                completion(productSet, nil)
            } catch {
                completion(nil, error)
            }
        } else {
            completion(nil, nil)
        }
    }
}
