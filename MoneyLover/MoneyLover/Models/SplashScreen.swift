//
//  Page.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 11/23/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class SplashScreen {
    
    var imageName: String
    var description: String
    
    init(imageName: String, description: String) {
        self.imageName = imageName
        self.description = description
    }
}

class SplashScreenData {
    var dataPage = [SplashScreen]()
    
    init() {
        dataPage.append(SplashScreen(imageName: "page01", description: "Quản lý chi tiêu cá nhân và hoàn thiện mục tiêu tài chính."))
        dataPage.append(SplashScreen(imageName: "page02", description: "Dễ dàng truy cập Money Lover trên nhiểu thiết bị."))
        dataPage.append(SplashScreen(imageName: "page03", description: "Kiểm soát từng loại thu chi với hện thống báo cáo chi tiết."))
        dataPage.append(SplashScreen(imageName: "page04", description: "Lên kế hoạch tài chính thông minh và từng bước tiết kiệm để thực hiện hóa ước mơ"))
    }
}
