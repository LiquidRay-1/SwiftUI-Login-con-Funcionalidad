//
//  SecondView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct UserView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack{
            Image("gojo")
                .padding(50)
            Button("Username"){
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented, onDismiss: { isPresented = false }, content: { ModalView(isPresented: $isPresented)
            .presentationDetents([.medium])
        })
    }
}

#Preview {
    UserView()
}
