//
//  SettingsView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var rememberPassword = false
    @Binding var officialUserName: String
    
    var body: some View {
        Form{
            Text("Nombre de usuario: \($officialUserName)")
            Section{
                Text("Nuevo nombre de Usuario:")
                TextField("Nombre de usuario", text:
                        .constant(""))
                .frame(width: 200, height: 30)
                .background(.bar)
                .clipShape(.buttonBorder)
            }
            Section{
                HStack{
                    Toggle(isOn: $rememberPassword) {
                        
                    }
                    .frame(width: 50)
                    .toggleStyle(SwitchToggleStyle(tint: .cyan))
                    .padding(10)
                    
                    Text("Recordar contraseña")
                }
            }
            Text("Nueva contraseña:")
            TextField("Nueva contraseña", text:
                    .constant(""))
                    .frame(width: 200, height: 30)
                    .background(.bar)
                    .clipShape(.buttonBorder)
        }
    }
}

#Preview {
    SettingsView(officialUserName: .constant("User"))
}
