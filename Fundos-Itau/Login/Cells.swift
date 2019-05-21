//
//  Fields.swift
//  Fundos-Itau
//
//  Created by Phelipe Campos on 20/05/19.
//  Copyright © 2019 Lopes. All rights reserved.
//

import UIKit

class Cells: Codable{
    var fields: [Fields]?
    
    enum CodingKeys: String, CodingKey {
        case fields = "cells"
    }
}
class Fields: Codable {
    var id: Int?
    var type: Int?
    var message: String?
    var typefield: MyValue?
    var hidden = false
    var topSpacing: Double?
    var show: Int?
    var required = false
    var typed = ""
    }


enum MyValue: Codable {
    case string(String)
    case int(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .string(String(x))
            return
        }
        throw DecodingError.typeMismatch(MyValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MyValue"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .int(let x):
            try container.encode(x)
        }
    }
}
    

