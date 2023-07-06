//
//  HomeReponseModel.swift
//  BiwaAn
//
//  Created by TTH on 06/07/2023.
//

import Foundation


class HomeReponse: Codable {
    let status: Int
    let data: [DataHomeReponse]
    let message: String
    
    init(status: Int, data: [DataHomeReponse], message: String) {
        self.status = status
        self.data = data
        self.message = message
    }
}

class DataHomeReponse: Codable {
    let id: Int
    let name: String
    let product_variant: [ProductVariant]
    var iSelected: Bool?

    init(id: Int, name: String, iSelected: Bool = false, productVariant: [ProductVariant]) {
        self.id = id
        self.name = name
        self.iSelected = iSelected
        self.product_variant = productVariant
    }
}

class ProductVariant: Codable {
    let id: Int
    let name: String
    var iSelected: Bool?

    init(id: Int, name: String, iSelected: Bool = false) {
        self.id = id
        self.name = name
        self.iSelected = iSelected
    }
}
