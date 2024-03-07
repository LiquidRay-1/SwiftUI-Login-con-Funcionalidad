//
//  SecondView.swift
//  LoginUI
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct UserView: View {
    
    @State var isPresented: Bool = false
    @State var selected = false
    @Binding var officialUserName: String
    
    var body: some View {
        VStack{
            Image("gojo")
                .padding(50)
                .rotation3DEffect(
                .degrees(selected ? 360: 0),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .onTapGesture {
                    self.selected.toggle()
                }
                .animation(.spring(response: 0.7))
            Button("Username"){
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented, onDismiss: { isPresented = false }, content: { ModalView(isPresented: $isPresented, officialUserName: $officialUserName)
            .presentationDetents([.medium])
        })
    }
}

#Preview {
    UserView(officialUserName: .constant("User"))
        .environmentObject(UserData())
}
