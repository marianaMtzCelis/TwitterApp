//
//  TweetCell.m
//  twitter
//
//  Created by Mariana Martinez on 29/06/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshData {
    
    self.nameLabel.text = self.tweet.user.name;
    self.dateLabel.text = self.tweet.createdAtString;
    self.tweetLabel.text = self.tweet.text;
    
    NSString *handle = self.tweet.user.screenName;
    NSString *fullHandle = [@"@" stringByAppendingString:handle];
    self.handleLabel.text = fullHandle;
    
    NSURL *ppURL = [NSURL URLWithString:self.tweet.user.profilePicture];
    [self.profilePictureView setImageWithURL:ppURL];
    
    [self.rtButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.retweetCount] forState:UIControlStateNormal];
    
    [self.favButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.favoriteCount] forState:UIControlStateNormal];
    
}

- (IBAction)didTapFavorite:(id)sender {
    
    if (!self.tweet.favorited) {
        
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self refreshData];
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                [self.favButton.imageView setImage:[UIImage imageNamed:@"favor-icon-red"]];
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
        
    } else {
        
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self refreshData];
        
        [[APIManager shared] unFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                [self.favButton.imageView setImage:[UIImage imageNamed:@"favor-icon"]];
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
        
    }
}

- (IBAction)didTapRT:(id)sender {
    
    if (!self.tweet.retweeted) {
        
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self refreshData];
        
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                [self.rtButton.imageView setImage:[UIImage imageNamed:@"retweet-icon-green"]];
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
        
        
    } else {
        
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self refreshData];
        
        [[APIManager shared] unRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                [self.rtButton.imageView setImage:[UIImage imageNamed:@"retweet-icon"]];
                NSLog(@"Successfully unretweeting the following Tweet: %@", tweet.text);
            }
        }];
        
    }
}


@end
