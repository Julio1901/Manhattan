//
//  CoffeViewModel.swift
//  Manhattan
//
//  Created by Julio Cesar  on 25/06/22.
//

import Foundation

final class CoffeViewModel{
    
    private var randomCoffeObj: CoffeDTO? = nil
    
    
    init(){
        randomCoffeImage()
    }
    
    //TODO: Replace it to implement repository layer with useCases
    func randomCoffeImage() {
        
        guard let url = URL(string: "https://coffee.alexflipnote.dev/random.json") else {return}
        
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) in
            
            guard let responseData = data else {return}
            
            do{
                let coffe = try JSONDecoder().decode(CoffeDTO.self, from: responseData)
                self.randomCoffeObj = coffe
            } catch let error {
                print("error: \(error)")
            }
        }
        
        //TODO: Replace it to run in other thread
        task.resume()
        //print("test \(self.randomCoffeObj?.file)")
    }

    //TODO: treat it from nil cases
    func getCoffeImage () -> String {
        
        if let imageURL = self.randomCoffeObj?.file{
            return imageURL
        }else{
            //TODO: Change this default value
            return ""
        }
        
    }
    
    
    
}
