//
//  MemberListManager.swift
//  MemberList_0422
//
//  Created by siyeon park on 2022/04/22.
//

import Foundation

final class MemberListManager {
    
    private var memberList: [Member] = []
    
    func makeMemberListDatas() {
        memberList = [
            Member(name: "홍길동", age: 20, phone: "010-1111-2222", address: "서울"),
            Member(name: "임꺽정", age: 23, phone: "010-3333-2223", address: "서울"),
            Member(name: "스티브", age: 50, phone: "010-4444-2224", address: "미국"),
            Member(name: "쿡", age: 30, phone: "010-5555-2225", address: "캘리포니아"),
            Member(name: "베조스", age: 50, phone: "010-6666-2226", address: "하와이"),
            Member(name: "배트맨", age: 40, phone: "010-7777-2227", address: "고담씨티"),
            Member(name: "조커", age: 40, phone: "010-8888-2228", address: "고담씨티")
        ]
    }
    
    func getMembersList() -> [Member] {
        return memberList
    }
    
    func makeNewMember(_ member: Member) {
        memberList.append(member)
    }
    
    func updateMemberInfo(index: Int, _ member: Member) {
        memberList[index] = member
    }
    
    subscript(index: Int) -> Member {
        get {
            return memberList[index]
        }
        set {
            memberList[index] = newValue
        }
    }
}
