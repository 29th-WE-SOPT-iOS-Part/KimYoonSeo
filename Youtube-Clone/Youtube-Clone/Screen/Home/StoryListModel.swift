//
//  StoryListModel.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/28.
//

import Foundation


struct StoryListModel {
    private var data: [Story]?
    
    init() {
        self.data = [ Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해"),
                      Story(image: "wesoptiOSPartprofile", text: "아요사랑해")
        ]
    }
    
    public func getVideoListModel() -> [Story] {
        return data ?? []
    }
  
}
