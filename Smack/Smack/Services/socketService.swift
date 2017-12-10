//
//  socketService.swift
//  Smack
//
//  Created by TheNextG on 12/8/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit
// the socket 
import SocketIO
class socketService: NSObject {
    
    static let instance = socketService()
    
    override init() {
        super.init()
    }
    
    var socket : SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    func eatablishConnection() {
        socket.connect()
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
    func addChannel(channelName: String,channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("channelName", channelName, channelDescription)
        completion(true)
        
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let CchannelDesc = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: CchannelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
            
        }
    }
    
}
