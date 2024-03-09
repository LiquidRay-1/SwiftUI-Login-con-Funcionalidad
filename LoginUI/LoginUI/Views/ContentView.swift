//
//  ContentView.swift
//  LoginUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            LoginView()
                .environmentObject(UserData())
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserData())
}
