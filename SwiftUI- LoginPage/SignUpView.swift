//
//  SignUpView.swift
//  SwiftUI- LoginPage
//
//  Created by Aaryan Kothari on 16/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State var email : String = ""
    @State var password : String = ""
    @State var error : String = ""
    @EnvironmentObject var session : sessionStore
    
    func signUp(){
        session.signUp(email: email, Password: password) { (result, error) in
            if let error = error{
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
            }
        }
    }
    var body: some View {
        VStack {
            Text("Create Account")
                .font(.system(size: 32, weight: .heavy, design: .default))
            Text("Sign up to get started")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.gray)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
