//
//  RCDataService.swift
//  RCE
//
//  Created by xuefeng on 2022/2/7.
//

import Moya

public let uploadProvider = RCSProvider<RCUploadService>(plugins: [RCSServiceLogger])

public enum RCUploadService {
    case upload(data: Data)
    case uploadAudio(data: Data, extensions: String? = nil)
}

extension RCUploadService: RCSServiceType {
    public var path: String {
        return "file/upload"
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var task: Task {
        switch self {
        case let .upload(data):
            let imageData = MultipartFormData(provider: .data(data), name: "file", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
            return .uploadMultipart([imageData])
        case let .uploadAudio(data, ext):
            let fileName = "\(Int(Date().timeIntervalSince1970)).\(ext ?? "mp3")"
            let imageData = MultipartFormData(provider: .data(data), name: "file", fileName: fileName, mimeType: "audio/mpeg3")
            return .uploadMultipart([imageData])
        }
    }
}

public struct RCSUploadService {
    let data: Data
    /// 文件元数据类型：audio/mpeg3、image/jpeg 等
    let mimeType: String
    let fileName: String
    
    /// 初始化
    /// - Parameters:
    ///   - data: 数据
    ///   - mimeType: 数据类型
    ///   - ext: 扩展名字：jepg、mp3 等
    public init(data: Data, mimeType: String, ext: String) {
        self.data = data
        self.mimeType = mimeType
        self.fileName = "\(Int(Date().timeIntervalSince1970)).\(ext)"
    }
}

extension RCSUploadService: RCSServiceType {
    public var path: String { "file/upload" }
    public var method: Moya.Method { .post }
    public var task: Task {
        let imageData = MultipartFormData(provider: .data(data),
                                          name: "file",
                                          fileName: fileName,
                                          mimeType: mimeType)
        return .uploadMultipart([imageData])
    }
}
