//
//  MessageService.swift
//  Smack
//
//  Created by TheNextG on 12/7/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler){
        Alamofire.request(URL_GET_CHANNEL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                // this is how to find the channels using the JSON the other way by using swift check the lecture 82 to find how he did  it 
                do {
                    if let json = try JSON(data: data).array{
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["-id"].stringValue
                            // we are gitting all channel availabel for this user in this loop then we are adding it to the next step
                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                        print(self.channels[0].channelTitle)
                        completion(true)
                    }
                    
                }catch {
                    debugPrint(error as Any)
                }
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
