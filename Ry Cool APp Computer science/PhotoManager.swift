////
////  PhotoManager.swift
////  Ry Cool APp Computer science
////
////  Created by Ry Natterson on 5/8/23.
////
//import Photos
//import UIKit
//
//class PhotoManager {
//    static func loadRandomPhoto(completion: @escaping (UIImage?) -> Void) {
//        let options = PHFetchOptions()
//        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        options.fetchLimit = 1
//
//        let fetchResult = PHAsset.fetchAssets(with: .image, options: options)
//
//        if let asset = fetchResult.firstObject {
//            let manager = PHImageManager.default()
//            let requestOptions = PHImageRequestOptions()
//            requestOptions.isSynchronous = true
//            manager.requestImage(for: asset, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFit, options: requestOptions) { (image, _) in
//                completion(image)
//            }
//        } else {
//            completion(nil)
//        }
//    }
//
//    static func getYear(from photo: PHAsset) -> Int? {
//        if let date = photo.creationDate {
//            let calendar = Calendar.current
//            return calendar.component(.year, from: date)
//        } else {
//            return nil
//        }
//    }
//}
