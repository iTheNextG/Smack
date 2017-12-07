//
//  Channel.swift
//  Smack
//
//  Created by TheNextG on 12/7/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import Foundation

struct Channel : Decodable{
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
