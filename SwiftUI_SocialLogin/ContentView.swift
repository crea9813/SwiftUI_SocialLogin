//
//  ContentView.swift
//  SwiftUI_SocialLogin
//
//  Created by Yang on 2019/11/29.
//  Copyright © 2019 Minestrone. All rights reserved.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    var body: some View {
        HStack{
            VStack{
                Button(action: SocialLogin.attemptLoginGoogle,label: {
                        Image("google").frame(width: 20, height: 20)
                })
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .background(Color.white)
                    .cornerRadius(8.0)
                    .shadow(radius: 4.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SocialLogin: UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<SocialLogin>) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialLogin>) {
    }

    static func attemptLoginGoogle(){
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
        }
}
