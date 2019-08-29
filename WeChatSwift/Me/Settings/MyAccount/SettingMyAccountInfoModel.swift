//
//  SettingMyAccountInfoModel.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/8/12.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import Foundation
import AsyncDisplayKit

struct SettingMyAccountInfoSection {
    
    var items: [SettingMyAccountInfoModel]
    
    var footer: String? = nil
    
    init(items: [SettingMyAccountInfoModel]) {
        self.items = items
    }
}

enum SettingMyAccountInfoModel: WCTableCellModel {
    case wechatId
    case phoneNumber
    case wechatPassword
    case voicePassword
    case emergencyContact
    case deviceManagement
    case moreSecuritySettings
    case freezeAccount
    case securityCenter
    
    var wc_title: String {
        switch self {
        case .wechatId:
            return "微信号"
        case .phoneNumber:
            return "手机号"
        case .wechatPassword:
            return "微信密码"
        case .voicePassword:
            return "声音锁"
        case .emergencyContact:
            return "应急联系人"
        case .deviceManagement:
            return "登录设备管理"
        case .moreSecuritySettings:
            return "更多安全设置"
        case .freezeAccount:
            return "帮朋友冻结微信"
        case .securityCenter:
            return "微信安全中心"
        }
    }
    
    var wc_accessoryNode: ASDisplayNode? {
        switch self {
        case .wechatId:
            return valueTextNode("wxid_dhsfg912nds")
        case .phoneNumber:
            let textNode = ASTextNode()
            let body = NSMutableAttributedString()
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "ProfileLockOn_17x17_")
            attachment.bounds = CGRect(x: 0, y: -3, width: 17, height: 17)
            body.append(NSAttributedString(attachment: attachment))
            body.append(NSAttributedString(string: "123456789101", attributes: [
                .font: UIFont.systemFont(ofSize: 17),
                .foregroundColor: UIColor(white: 0, alpha: 0.5)
            ]))
            textNode.attributedText = body
            return textNode
        case .wechatPassword:
            return valueTextNode("已设置")
        case .voicePassword:
            return valueTextNode("未设置")
        default:
            return nil
        }
    }
    
    func valueTextNode(_ value: String) -> ASTextNode {
        let textNode = ASTextNode()
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.5)
        ]
        textNode.attributedText = NSAttributedString(string: value, attributes: attributes)
        return textNode
    }
}
