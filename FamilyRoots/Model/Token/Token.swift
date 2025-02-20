//
//  Token.swift
//  FamilyRoots
//
//  Created by Apprenant 165 on 20/02/2025.
//

import Foundation
/// Structure pour definir le token
struct JWToken: Codable {
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case value = "token"
    }
}
