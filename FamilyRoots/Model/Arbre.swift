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
    
    init(id: UUID, nomArbre: String, quantiteBranche: Int, typeArbre: String) {
        self.id = id
        self.nomArbre = nomArbre
        self.quantiteBranche = quantiteBranche
        self.typeArbre = typeArbre
    }
    
    init() {
        self.id = UUID()
        self.nomArbre = "Barthes"
        self.quantiteBranche = 5
        self.typeArbre = "arbre"
    }
    
}
