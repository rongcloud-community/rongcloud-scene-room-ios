//
//  MusicDownloader.swift
//  RCE
//
//  Created by 叶孤城 on 2021/5/31.
//

import Alamofire
import SVProgressHUD

final class MusicDownloader {
    static let shared = MusicDownloader()
    func download(music: VoiceRoomMusic, completion: ((Bool) -> Void)? = nil) {
        guard !FileManager.default.fileExists(atPath: music.fileURL().path) else {
            completion?(true)
            return
        }
      guard let url = URL(string: music.url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!) else {
            completion?(false)
            return debugPrint("music url is nil")
        }
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent(music.name)
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        AF.download(url, to: destination).downloadProgress { progress in
            SVProgressHUD.showProgress(Float(progress.fractionCompleted))
        }.response { response in
            debugPrint(response)
            if response.error == nil{
                SVProgressHUD.showSuccess(withStatus: "音乐下载成功")
                completion?(true)
            } else {
                completion?(false)
            }
        }
    }
    
    func hifiveDownload(music: MusicInfo, completion: @escaping (Bool) -> Void) {
        
        guard let filePath = music.fullPath(), !FileManager.default.fileExists(atPath: filePath)  else {
            completion(true)
            return
        }
        guard let fileUrl = music.fileUrl, let url = URL(string: fileUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!) else {
            completion(false)
            return debugPrint("music url is nil")
        }
        let destination: DownloadRequest.Destination = { _, _ in
            
            let fileURL = URL(fileURLWithPath: filePath)
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        AF.download(url, to: destination).downloadProgress { progress in
            SVProgressHUD.showProgress(Float(progress.fractionCompleted))
        }.response { response in
            debugPrint(response)
            if response.error == nil{
                SVProgressHUD.showSuccess(withStatus: "音乐下载成功")
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
