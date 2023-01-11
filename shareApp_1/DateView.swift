//
//  DateView.swift
//  shareApp_1
//
//  Created by ひがしもとあおい on 2022/12/07.
//

//画像をフォトライブラリから取得すr
//歩数を取得する
//バッテリー残量を取得する
//位置情報を取得する

import SwiftUI
import Firebase
import FirebaseAuth


struct DateView: View {
    
    @ObservedObject var batteryVM = BatteryViewModal()
    
    var body: some View {
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
                Text("バッテリー残量\(batteryVM.remain)")
                
                if batteryVM.status == .charging {
                    Text("充電中")
                } else if batteryVM.status == .full {
                    Text("満充電")
                } else if batteryVM.status == .unplugged {
                    Text("バッテリーで動作中")
                } else if batteryVM.status == .unknown {
                    Text("状態不明")
                }
                
                Button("バッテリーを確認") {
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                
                
                Button("次の画面へ") {
                   
                }
                
                
            }
            .onAppear() {
                self.batteryVM.starMonitor()
            }
            .onDisappear() {
                self.batteryVM.stopmoniter()
            }
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
