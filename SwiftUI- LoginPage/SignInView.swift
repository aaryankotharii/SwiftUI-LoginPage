//
//  SignInView.swift
//  SwiftUI- LoginPage
//
//  Created by Aaryan Kothari on 16/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var error : String = ""
    @EnvironmentObject var session : sessionStore
    
    var bg1 = Color.init(red: 158/255, green: 152/255, blue: 240/255)
    var bg2 = Color.init(red: 109/255, green: 124/255, blue: 240/255)

    func signIn(){
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error{
                self.error = error.localizedDescription
            }
            else{
                self.email = ""
                self.password = ""
            }
        }
    }
    var body: some View {
        VStack {
            Text("Welcome Back!")
                .font(.system(size: 32, weight: .heavy, design: .default))
            Text("sign in to continue")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(bg1)
            
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
            
            Button(action: signIn){
                Text("Signin")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size:14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [bg1,bg2]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(5)
        }
        Spacer()
            HStack{
                Text("new here?")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.primary)
            NavigationLink(destination: SignUpView()){
                    Text("Create an account")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(bg2)
                }
            }
        }
        .padding(.horizontal, 32)
}
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

