//
//  Login.swift
//  FamilyRoots
//
//  Created by Apprenant 165 on 20/02/2025.
//

import Foundation
import SwiftUI
/// La vue de l'authentification
struct Login: View {
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("arbreIcon")
                    .resizable()
                    .frame(width: 200, height: 270)
                
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.mdp)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Button(action: {

                    viewModel.login(email: viewModel.email, password: viewModel.mdp) { success in
                        if success && !viewModel.email.isEmpty && !viewModel.mdp.isEmpty {
                            authManager.isLoggedIn = true
                        } else {
                            print("Identifiants invalides")
                        }
                    }
                    
                }) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                
            }
            NavigationLink(destination: SignUp()) {
                Text("Pas encore inscrit ? S'inscrire")
                    .font(.footnote)
                    .foregroundColor(.secondary).bold()
            }.padding()
        }.padding()
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
