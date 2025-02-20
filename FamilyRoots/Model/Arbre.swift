//
//  Arbre.swift
//  FamilyRoots
//
//  Created by Apprenant 165 on 06/02/2025.
//

import Foundation
struct Arbre: Codable {
    var id: UUID
    var nomArbre: String
    var quantiteBranche: Int
    var typeArbre: String
}
struct CreateArbreDTO: Codable {
    let nomArbre: String
    let quantiteBranche: Int
    let typeArbreID: UUID
}
struct ArbreDTO: Codable {
    let id: UUID?
    let nomArbre: String
    let quantiteBranche: Int
    let typeArbre: TypeArbreDTO
}

struct TypeArbreDTO: Codable {
    let id: UUID?
    let typeArbre: String
    let imageArbre: String
}
