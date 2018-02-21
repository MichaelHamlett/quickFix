//
//  AudioModel.swift
//  quickFix
//
//  Created by Michael Hamlett, Akshay Trikha, Pratyush Kapur on 10/28/17.
//  Copyright © 2017 Michael Hamlett, Akshay Trikha, Pratyush Kapur, Shiv Seetharaman, Maxwell Maleno. All rights reserved.

import Foundation

class AudioModel{
    
    var id : String?
    var text : String?
    var downloadURL : String?
    var date : String?
    var time : String?
    
    init(id : String?, text : String?, downloadURL : String?, time : String?) {
        
        self.id = id;
        self.text = text;
        self.downloadURL = downloadURL;
        self.time = time;
        //        self.date = date;
        
        
    }
        
}
