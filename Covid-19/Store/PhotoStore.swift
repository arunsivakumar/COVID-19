//
//  PhotoStore.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

enum ImageResult {
      case success(UIImage)
      case failure(Error)
}

enum PhotoError: Error{
     case imageCreationError
}


class PhotoStore {
    
    let imageStore = ImageStore()
    
    /// Holds a URLSession instance.
      private let session:URLSession = {
         let configuration = URLSessionConfiguration.default
          return URLSession(configuration: configuration)
      }()
    
    func fetchImage(for photoKey: String, completion: @escaping (ImageResult) -> Void){
        
        
        if let image = imageStore.image(forKey: photoKey) {
            OperationQueue.main.addOperation {
                completion(.success(image))
            }
        }
        
        guard let imageURL = URL(string: photoKey) else{
            preconditionFailure("photoexpected to have remote URL")
        }
        let request = URLRequest(url:imageURL as URL)
        
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            let result = self.processImageRequest(data: data, error: error)
           
             // cache images
            if case let .success(image) = result {
                self.imageStore.setImage(image, forKey: photoKey)
            }
            
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processImageRequest(data: Data?, error: Error?) -> ImageResult {
        guard
            let imageData = data,
            let image = UIImage(data: imageData) else{
                
                
                // error creating image
                if data == nil{
                    return .failure(error!)
                }else{
                    return .failure(PhotoError.imageCreationError)
                }
        }
        
        return .success(image)
    }
    
}
