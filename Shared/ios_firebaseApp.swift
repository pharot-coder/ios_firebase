//
//  ios_firebaseApp.swift
//  Shared
//
//  Created by Leng Sopharot on 1/12/21.
//

import SwiftUI
import Firebase

@main
struct ios_firebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
