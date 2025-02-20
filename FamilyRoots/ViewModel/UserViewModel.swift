//
//  UserViewModel.swift
//  FamilyRoots
//
//  Created by Apprenant 165 on 20/02/2025.
//

import Foundation
class UserViewModel: ObservableObject {
    
    
    /// Variables pour l'authentification et l'inscription
    @Published var email = "john.doe@example.com"
    @Published var mdp = "password123"
    @Published var errorMessage = ""
    @Published var prenom = ""
    @Published var nom: String = ""
    @Published var sexe: String = ""
    @Published var photo: String = ""
    @Published var dateNaissanceUser = Date()
    
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8080/users/login") else {
            print("Invalid URL")
            completion(false) // Echec immédiat
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedString()
        request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let responseHttp = response as? HTTPURLResponse, responseHttp.statusCode == 200,
                  let data = data else {
                DispatchQueue.main.async {
                    completion(false) // Indique l'échec
                }
                return
            }
            
            print("Authentification réussie")
            
            do {
                let token = try JSONDecoder().decode(JWToken.self, from: data)
                print("token: ", token.value)
                KeyChainManager.saveToken(token: token.value)
                DispatchQueue.main.async {
                    completion(true) // Succès
                }
            } catch {
                print("Erreur dans le décodage du token")
                DispatchQueue.main.async {
                    completion(false) // Echec
                }
            }
        }.resume()
    }
}
