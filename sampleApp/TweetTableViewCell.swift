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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.screenNameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.textContentLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.screenNameLabel.font = UIFont.italicSystemFont(ofSize: 12)
        self.textContentLabel.font = UIFont.systemFont(ofSize: 14)
        
        self.iconImageView.clipsToBounds = true
        self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width / 2.0
        
        self.iconImageView.layer.borderColor = #colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1).cgColor
        self.iconImageView.layer.borderWidth = 1.0
    }
}
