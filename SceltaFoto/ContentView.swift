//
//  ContentView.swift
//  SceltaFoto
//
//  Created by Michele on 08/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var image : Image? = nil
    @State var showCaptureImageView : Bool = false
    var body: some View {
        ZStack{
            VStack{
                Button(action: {
                    self.showCaptureImageView.toggle()
                }, label: {
                    Text("Choose photos")
                })
                image?.resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 4))
                    .shadow(radius: 10)
            }
            if(showCaptureImageView){
                CatturaImmagine(isShow: $showCaptureImageView, image: $image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
