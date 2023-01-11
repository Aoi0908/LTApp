//
//  listView.swift
//  Pods
//
//  Created by ひがしもとあおい on 2023/01/11.
//

import SwiftUI

struct listView: View {
    let countries = countryList
    
    var body: some View {
        NavigationView{
            List {
                ForEach(countries, id: \.self) { country in
                    NavigationLink(destination: Text(country)) {
                        Image(systemName: "airplane")
                        Text(country)
                    }.padding()
                    
                }
            }
            .navigationTitle("シェアするリスト")
        }
    }
}

struct listView_Previews: PreviewProvider {
    static var previews: some View {
        listView()
    }
}
