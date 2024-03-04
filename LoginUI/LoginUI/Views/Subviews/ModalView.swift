//
//  ModalView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Text("Usuario: ")
                Button("Cerrar"){
                    isPresented = false
                }
            }
        }
    }
}

#Preview {
    ModalView(isPresented: .constant(true))
}
