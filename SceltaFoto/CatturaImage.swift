//
//  CatturaImage.swift
//  SceltaFoto
//
//  Created by Michele on 08/01/21.
//

import Foundation
import UIKit
import SwiftUI

struct CatturaImmagine: UIViewControllerRepresentable{
    
//    MARK -Properties
    @Binding var isShow : Bool
    @Binding var image : Image?
//    metodo che crea 2 cordinatori 
    func makeCoordinator() -> Coordinator  {
        return Coordinator(isShow: $isShow, image: $image)
    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CatturaImmagine>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
//        Per fare scegliere il
//        picker.sourceType = .camera
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CatturaImmagine>) {
        
    }
}
class Coordinator : NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
//    Si occupa della comunicazione con UIKit e swiftUI
    @Binding var isCoordinatorShow : Bool
    @Binding var imageInCoordnator : Image?
    init(isShow : Binding<Bool>, image : Binding<Image?>){
        _isCoordinatorShow = isShow
        _imageInCoordnator = image
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard  let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageInCoordnator = Image(uiImage: unwrapImage)
        isCoordinatorShow = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShow = false
    }
}
