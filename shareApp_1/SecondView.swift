//
//  SecondView.swift
//  shareApp_1
//
//  Created by ひがしもとあおい on 2022/12/14.
//

import SwiftUI

struct SecondView: View {
    @State private var showingSecondScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("バッテリーを確認") {
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                NavigationLink(destination: DateView(), isActive: $showingSecondScreen) {
                    EmptyView()
                }
                
            }.navigationBarHidden(true)

        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
