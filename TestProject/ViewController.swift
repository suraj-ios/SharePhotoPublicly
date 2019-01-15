//
//  ViewController.swift
//  TestProject
//
//  Created by Suraj on 13/12/18.
//  Copyright © 2018 Suraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let documentInteractionController = UIDocumentInteractionController()
    
    //com.instagram.exclusivegram
    //public.image
    //com.instagram.photo
    private let kUTI = "public.png"
    var imageInstagram = UIImage(named: "no-wifi.png")
    //instagram.ig
    //.jpeg // facebook and insta..
    //.png
    //Image.igo // No facebook
    private let kfileNameExtension = ".png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func share(_ sender: Any) {
        
        let jpgPath = (NSTemporaryDirectory() as NSString).appendingPathComponent(kfileNameExtension)
        
        do {
            try imageInstagram!.jpegData(compressionQuality: 1.0)?.write(to: URL(fileURLWithPath: jpgPath), options: .atomic)
        } catch {
            print(error)
        }
        
        let rect = CGRect.zero
        let fileURL = NSURL.fileURL(withPath: jpgPath)
        
        documentInteractionController.url = fileURL
        documentInteractionController.uti = kUTI
        
        documentInteractionController.presentOpenInMenu(from: rect, in: view, animated: true)
        
    }
    
}

