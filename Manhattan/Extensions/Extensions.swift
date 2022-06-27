//
//  Extensions.swift
//  Manhattan
//
//  Created by Julio Cesar  on 25/06/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func load(stringUrl: String){
        guard let url = URL(string: stringUrl) else {return}
    
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}

