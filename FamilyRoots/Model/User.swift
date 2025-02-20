//
//  User.swift
//  FamilyRoots
//
//  Created by Apprenant 165 on 12/02/2025.
//

import Foundation

struct User: Codable {
    var id: UUID
    var nomUser: String
    var prenomUser: String
    var emailUser: String
    var sexeUser: String
    var mdpUser: String
    var photoUser: String
    var dateNaissanceUser: Date

}
struct UserDTO: Codable {
    var id: UUID?
    var nomUser: String
    var prenomUser: String
    var emailUser: String
    var sexeUser: String
    var photoUser: String
    var dateNaissanceUser: Date
}
    
struct UserWithArbreFamilleDTO: Codable {
        var user: UserDTO
        var famille: Famille
        var arbre: ArbreDTO
    }

