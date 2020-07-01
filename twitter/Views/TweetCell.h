//
//  TweetCell.h
//  twitter
//
//  Created by Mariana Martinez on 29/06/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *handleLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;

@property (weak, nonatomic) IBOutlet UIButton *replyButton;

@property (weak, nonatomic) IBOutlet UIButton *rtButton;

@property (weak, nonatomic) IBOutlet UIButton *favButton;

@property (weak, nonatomic) IBOutlet UIButton *dmButton;

@property (weak, nonatomic) Tweet *tweet;


@end

NS_ASSUME_NONNULL_END
