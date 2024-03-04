//
//  SettingsView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            Text("Nombre de usuario: ")
                .padding(50)
            Text("Nuevo nombre de Usuario:")
            TextField("Nombre de usuario", text:
                    .constant(""))
                    .frame(width: 200, height: 30)
                    .background(.bar)
                    .clipShape(.buttonBorder)
            HStack{
                Toggle(isOn: .constant(false)) {
                    
                }
                .frame(width: 50)
                .toggleStyle(SwitchToggleStyle(tint: .cyan))
                
                Text("Recordar contraseña")
            }
            .padding()
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
    SettingsView()
}
