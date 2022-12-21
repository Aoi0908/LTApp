//
//  ContentView.swift
//  shareApp_1
//
//  Created by ひがしもとあおい on 2022/12/07.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    @State var ShowSherePopover: Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: DateView(), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "2022" {
            wrongUsername = 0
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
    
    func Share() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            ShowSherePopover = true
        } else {
            let link = URL(string: "https://twitter.com")!
            let activityViewController = UIActivityViewController(activityItems: [link], applicationActivities: nil)
            let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
            let viewController = scene?.keyWindow?.rootViewController
            viewController?.present(activityViewController, animated: true, completion: nil)
        }
        
    }
    
    struct ShareView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIActivityViewController {
            let link = URL(string: "https://qiita.com/SNQ-2001/items/86646b661ccc4a7a9034")!
            let activityViewController = UIActivityViewController( activityItems: [link], applicationActivities: nil)
            return activityViewController
        }
        func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
