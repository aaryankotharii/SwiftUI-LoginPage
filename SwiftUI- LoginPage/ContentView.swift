//
//  ContentView.swift
//  SwiftUI- LoginPage
//
//  Created by Aaryan Kothari on 16/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session : sessionStore
    
    func getUser(){
        session.listen()
    }
    var body: some View {
        Group{
            if (session.session != nil){
                Text("Welcome back user")
                Button(action: session.signOut){
                    Text("Sign Out")
                }
            }
            else{
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(sessionStore())
    }
}
