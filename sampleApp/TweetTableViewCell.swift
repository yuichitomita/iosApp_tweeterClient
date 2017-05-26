//
//  TweetTableViewCell.swift
//  sampleApp
//
//  Created by Tomi on 2017/05/02.
//  Copyright © 2017年 slj. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var textContentLabel: UILabel!
    
    func fill(tweet: Tweet) {
        //profileImageURLから画像をダウンロードしてくる処理
        let downloadTask = URLSession.shared.dataTask(with: URL(string: tweet.user.profileImageURL)!) {[weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                // iconImageViewにダウンロードしてきた画像を代入する処理
                self?.iconImageView.image = UIImage(data: data!)
            }
        }
        downloadTask.resume()
        
        //tweetから値を切り出して,UIにセットする
        nameLabel.text = tweet.user.name
        textContentLabel.text = tweet.text
        screenNameLabel.text = "@" + tweet.user.screenName
    }
}
