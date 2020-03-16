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
    
    var bg1 = Color.init(red: 158/255, green: 152/255, blue: 240/255)
    var bg2 = Color.init(red: 109/255, green: 124/255, blue: 240/255)
    
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
            
            VStack(spacing: 18){
                TextField("Email address", text: $email)
                    .font(.system(size:14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(bg1, lineWidth: 1 ))
                SecureField("Password", text: $password)
                    .font(.system(size:14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(bg1, lineWidth: 1 ))
            }
            .padding(.vertical,64)
            
        Button(action: signUp){
            Text("SignUp")
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .font(.system(size:14, weight: .bold))
                .background(LinearGradient(gradient: Gradient(colors: [bg1,bg2]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
            }
        Spacer()
        }.padding(.horizontal,32)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(sessionStore())
    }
}
