//
//  MenuView.swift
//  LoginUI
//
//  Created by Ivan on 8/3/24.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        TabView{
            UserView()
                .tabItem {
                    Label("Usuario", systemImage: "person")
                }
            SettingsView()
                .tabItem {
                    Label("Ajustes", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(UserData())
}
