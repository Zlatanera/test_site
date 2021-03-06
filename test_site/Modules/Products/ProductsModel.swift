//
//  PriceModel.swift
//  test_site
//
//  Created by User on 18.03.2021.
//

import Foundation

enum Products {
    
    struct Product: Codable {
        let items: [Item]
    }
    struct Item: Codable {
        let name: String
        let description: String
        let price: Double
    }
       
//        let priceObject = {
//            "items": [
//                {
//                    "name": "Item 1",
//                    "description": "Description 1",
//                    "price": 249
//                },
//                {
//                    "name": "Item 2",
//                    "description": "Description 2",
//                    "price": 199.99
//                },
//                {
//                    "name": "Item 3",
//                    "description": "Description 3",
//                    "price": 456
//                },
//                {
//                    "name": "Item 4",
//                    "description": "Description 4",
//                    "price": 783
//                },
//                {
//                    "name": "Item 5",
//                    "description": "Description 5",
//                    "price": 238.45
//                },
//            ]
//        }
//    }

}
