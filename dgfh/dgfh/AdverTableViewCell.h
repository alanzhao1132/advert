//
//  AdverTableViewCell.h
//  Advert
//
//  Created by zhaoalan on 15/9/30.
//  Copyright (c) 2015年 zhaoalan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdverTableViewCell : UITableViewCell

{
    UILabel *titlelable;
    UILabel *detaillable;
    UIImageView *imageview;
}
@property(nonatomic,retain)NSString *title;//主标题与附标题都放在里面了
@property(nonatomic,retain)UIImage *titlepicture;//广告图片
@property(nonatomic,assign)int status;//表格的广告显示标志位，展开与申缩
@end
