//
//  VideoListModel.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/27.
//

import Foundation

struct VideoListModel {
    private var data: [Video]?
    
    init() {
        self.data = [
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Video(preview: "wesoptiOSPart", profile:  "wesoptiOSPart", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전")
        ]
    }
    
    public func getVideoListModel() -> [Video] {
        return data ?? []
    }
  
}
