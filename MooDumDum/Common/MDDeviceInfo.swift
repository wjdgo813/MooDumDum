//
//  MDDeviceInfo.swift
//  MooDumDum
//
//  Created by Haehyeon Jeong on 2018. 2. 21..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import Foundation
/*
 Device 정보 얻는 클래스
 */

class MDDeviceInfo{
    
    /*
     UUID 얻는 메소드
     앱을 삭제하면 소유하고 있던 UUID가 다시 생성된다.
     */
    class func getCurrentDeviceID() -> String {
        var UUID = UserDefaults.standard.object(forKey: "uniqueID") as? String
        if UUID == nil {
            let theUUID: CFUUID = CFUUIDCreate(nil)
            let string: CFString = CFUUIDCreateString(nil, theUUID)
            UUID = (string as? String)?.replacingOccurrences(of: "-", with: "")
            UserDefaults.standard.setValue(UUID, forKey: "uniqueID")
        }
        return UUID ?? ""
    }
}
