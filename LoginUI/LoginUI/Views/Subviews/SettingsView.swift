//
//  SettingsView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        Form{
            Text("Nombre de usuario: \(userData.userName)")
            Section{
                Text("Nuevo nombre de Usuario:")
                TextField("Nombre de usuario", text: $userData.userName, onCommit: {
                    UserDefaults.standard.set(userData.userName, forKey: "correctUserName")
                })
                .frame(width: 200, height: 30)
                .background(.bar)
                .clipShape(.buttonBorder)
            }
            Section{
                HStack{
                    Toggle(isOn: $userData.userRemember) {
                        
                    }
                    .frame(width: 50)
                    .toggleStyle(SwitchToggleStyle(tint: .cyan))
                    .padding(10)
                    
                    Text("Recordar contraseña")
                }
            }
            Text("Nueva contraseña:")
            TextField("Nueva contraseña", text: $userData.userPassword, onCommit: {
                UserDefaults.standard.set(userData.userPassword, forKey: "correctUserPassword")
            })
            .frame(width: 200, height: 30)
            .background(.bar)
            .clipShape(.buttonBorder)
            Section{
                Text("Nota: Pulsa intro en tu teclado en cada campo para guardar los cambios.")
                    .textScale(.secondary)
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(UserData())
}
