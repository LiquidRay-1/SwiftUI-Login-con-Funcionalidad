//
//  ModalView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        ZStack{
            VStack{
                Text("Usuario: \(userData.userName)")
            }
        }
    }
}

#Preview {
    ModalView()
        .environmentObject(UserData())
}
