//
//  BubbleMusicInfo.swift
//  Alamofire
//
//  Created by shaoshuai on 2022/5/23.
//

struct BubbleMusicInfo: Codable {
    let name: String
    let author: String
    let backgroundUrl: String
}

public class MusicInfo: NSObject, RCMusicInfo {

    override init() {}
    
    public func encode(with coder: NSCoder) {
        coder.encode(self.fileUrl ?? "", forKey: "fileUrl")
        coder.encode(self.coverUrl ?? "", forKey: "coverUrl")
        coder.encode(self.author ?? "", forKey: "author")
        coder.encode(self.musicName ?? "", forKey: "musicName")
        coder.encode(self.size ?? "", forKey: "size")
        coder.encode(self.albumName ?? "", forKey: "albumName")
        coder.encode(self.musicId ?? "", forKey: "musicId")
    }
    
    required public init?(coder: NSCoder) {
        self.fileUrl = coder.decodeObject(forKey: "fileUrl") as! String?
        self.coverUrl = coder.decodeObject(forKey: "coverUrl") as! String?
        self.author = coder.decodeObject(forKey: "author") as! String?
        self.musicName = coder.decodeObject(forKey: "musicName") as! String?
        self.size = coder.decodeObject(forKey: "size") as! String?
        self.albumName = coder.decodeObject(forKey: "albumName") as! String?
        self.musicId = coder.decodeObject(forKey: "musicId") as! String?
    }
    
    
    public var fileUrl: String?
    
    public var coverUrl: String?
    
    public var musicName: String?
    
    public var author: String?
    
    public var albumName: String?
    
    public var musicId: String?
    
    public var size: String?
    
    public var isLocal: NSNumber?
    
    //本地文件path
    public var localDataFilePath: String?
    //业务需要的歌曲数字id
    public var id: Int?
    
    public func isEqual(toMusic music: RCMusicInfo?) -> Bool {
        guard let music = music else {
            return false
        }

        return musicId == music.musicId
    }
    
    func fullPath() -> String? {
        guard let musicId = musicId, let dir = RCSMusicDataSource.musicDir() else {
            return nil
        }
        return dir + "/" + musicId
    }
    
    static func localMusic(_ fileURL: URL) -> MusicInfo? {
        guard var filePath = RCSMusicDataSource.musicDir() else {
            return nil
        }
        do {
            guard fileURL.startAccessingSecurityScopedResource() else {
                return nil
            }
            var name = fileURL.lastPathComponent
            var author = ""
            filePath = filePath + "/" + name
            if FileManager.default.fileExists(atPath: filePath) {
                try FileManager.default.removeItem(atPath: filePath)
            }
            try FileManager.default.copyItem(at: fileURL, to: URL(fileURLWithPath: filePath))
            let asset = AVURLAsset(url: URL(fileURLWithPath: filePath))
            for format in asset.availableMetadataFormats {
                let metadata = asset.metadata(forFormat: format)
                for item in metadata {
                    if item.commonKey?.rawValue == "title" {
                        name = item.value as? String ?? ""
                    } else if item.commonKey?.rawValue == "artist" {
                        author = item.value as? String ?? ""
                    }
                }
            }
            
            let attribute = try FileManager.default.attributesOfItem(atPath: filePath)
            let fileSize = attribute[.size] as? Int ?? 0
            
            let info = MusicInfo()
            info.musicName = name
            info.author = author
            info.size = ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
            info.musicId = (info.musicName! + info.size!).md5()
            info.localDataFilePath = fileURL.relativePath;
            let _ = fileURL.startAccessingSecurityScopedResource()
            
            return info
        } catch {
            return nil
        }
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let musicInfo = object as? MusicInfo else {
            return false
        }
        return musicId == musicInfo.musicId
    }
}

class MusicCategoryInfo: NSObject, RCMusicCategoryInfo {
    var categoryId: String?
    var categoryName: String?
    var selected: Bool
    override init() {
        selected = false
        super.init()
    }
}

class EffectInfo: NSObject, RCMusicEffectInfo {
    var effectName: String?
    var filePath: String?
    var soundId: Int
    override init() {
        soundId = 0
        super.init()
    }
}
