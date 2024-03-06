//
//  LoginView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

class UserData: ObservableObject{
    @Published var userName: String = ""
    @Published var userPassword: String = ""
}

struct LoginView: View {
    
    @StateObject var userData = UserData()
    
    @State var officialUsername = "user"
    @State var officalPassword = "pass"
    
    @State var rememberPassword: Bool = false
    
    @State var errorAlert = false
    
    var body: some View {
        ZStack {
            Color
                .cyan
                .ignoresSafeArea(.all)
            
            Circle()
                .foregroundStyle(.bar)
                .frame(width: 700)
            
            Circle()
                .foregroundStyle(.white)
                .frame(width: 500)
            
            VStack{
                Text("Iniciar sesión")
                    .font(.largeTitle)
                
                TextField("Nombre de usuario", text:
                        .constant(""))
                        .frame(width: 300, height: 50)
                        .background(.bar)
                        .clipShape(.buttonBorder)
                
                SecureField("Contraseña", text:
                        .constant(""))
                        .frame(width: 300, height: 50)
                        .background(.bar)
                        .clipShape(.buttonBorder)
                        
                
                HStack{
                    Toggle(isOn: $rememberPassword) {
                        
                    }
                    .frame(width: 50)
                    .toggleStyle(SwitchToggleStyle(tint: .cyan))
                    
                    Text("Recordar contraseña")
                }.padding(5)
                
                Button("Login") {
                    permitirInicio()
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding()
                .background(.cyan)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
                
                Text("Recuperar Contraseña")
                    .foregroundColor(.cyan)
                    .frame(height: 50)
                    .padding(.trailing, -100)
            }
        }
    }
    
    func permitirInicio(){
        if (userName != officialUsername){
            
        }else if (userPassword != officalPassword){
            
        }else{
            UserView()
        }
    }
}

#Preview {
    LoginView()
}
