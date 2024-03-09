//
//  LoginView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

class UserData: ObservableObject{
    @Published var userName: String {
        didSet {
            UserDefaults.standard.set(userName, forKey: "userName")
        }
    }
    @Published var userPassword: String {
        didSet {
            UserDefaults.standard.set(userPassword, forKey: "userPassword")
        }
    }
    @Published var userRemember: Bool {
        didSet {
            UserDefaults.standard.set(userRemember, forKey: "userRemember")
        }
    }

    init() {
        self.userName = UserDefaults.standard.object(forKey: "userName") as? String ?? ""
        self.userPassword = UserDefaults.standard.object(forKey: "userPassword") as? String ?? ""
        self.userRemember = UserDefaults.standard.object(forKey: "userRemember") as? Bool ?? false
    }
}

struct LoginView: View {
    
    //Variable de acceso a las propiedades de UserData
    @EnvironmentObject var userData : UserData
    
    //Variable de verificación de aparición de alert
    @State var errorAlert = false
    
    //Variable le controladora de la aparición de UserView()
    @State var isShowingUserView = false
    
    var body: some View {
        ZStack {
            Color
                .black
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
                
                TextField("Nombre de usuario", text: $userData.userName)
                        .frame(width: 300, height: 50)
                        .background(.bar)
                        .clipShape(.buttonBorder)
                
                SecureField("Contraseña", text: $userData.userPassword)
                        .frame(width: 300, height: 50)
                        .background(.bar)
                        .clipShape(.buttonBorder)
                        
                
                HStack{
                    Toggle(isOn: $userData.userRemember) {
                        
                    }
                    .frame(width: 50)
                    .toggleStyle(SwitchToggleStyle(tint: .cyan))
                    
                    Text("Recordar contraseña")
                }.padding(5)
                
                Button("Login") {
                    if permitirInicio() {
                        self.isShowingUserView = true
                    }
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding()
                .background(.black)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
                .fullScreenCover(isPresented: $isShowingUserView) {
                    MenuView()
                }
                
                Text("Recuperar Contraseña")
                    .foregroundColor(.cyan)
                    .frame(height: 50)
                    .padding(.trailing, -100)
            }
        }
        .alert(isPresented: $errorAlert) {
            Alert(title: Text("Error"), message: Text("Credenciales incorrectas"), dismissButton: .default(Text("OK")))
        }
    }
    
    func permitirInicio() -> Bool {
        let correctUserName = UserDefaults.standard.object(forKey: "correctUserName") as? String ?? "user"
        let correctUserPassword = UserDefaults.standard.object(forKey: "correctUserPassword") as? String ?? "pass"

        if userData.userName == correctUserName && userData.userPassword == correctUserPassword {
            return true
        } else {
            errorAlert = true
            return false
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(UserData())
}
