//
//  AdverTableViewCell.m
//  Advert
//
//  Created by zhaoalan on 15/9/30.
//  Copyright (c) 2015年 zhaoalan. All rights reserved.
//

#import "AdverTableViewCell.h"
#import "PrefixHeader.pch"
@implementation AdverTableViewCell
@synthesize title,titlepicture,status;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark ---------
-(void)_initView//表单元初始化
{
    titlelable = [[UILabel alloc]initWithFrame:CGRectZero];//内容
    titlelable.font= [UIFont boldSystemFontOfSize:20.0f];
    titlelable.backgroundColor=[UIColor clearColor];
    //contenlable.numberOfLines = 0;
    [self.contentView addSubview:titlelable];
    [titlelable release];
    detaillable =[[UILabel alloc]initWithFrame:CGRectZero];
    detaillable.font =[UIFont boldSystemFontOfSize:20.0f];
    detaillable.backgroundColor = [UIColor clearColor];
    detaillable.numberOfLines = 0;
    [self.contentView addSubview:detaillable];
    [detaillable release];
    imageview =[[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:imageview];
    [imageview release];
}
-(CGSize)_returnContent:(UILabel *)lable//返回lable的宽高
{
    CGFloat w = NAVWIDTH/10 *8;
    CGSize rsize;
    UIFont *fnt = [UIFont boldSystemFontOfSize:20.0f];
    rsize = [lable.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    if (rsize.width > w)
    {
        lable.font=fnt;
        lable.numberOfLines=0;
        lable.lineBreakMode = NSLineBreakByWordWrapping;
        CGRect  tmpRect =[lable.text boundingRectWithSize:CGSizeMake(w, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil] context:nil];
        rsize.width = ceil(tmpRect.size.width);
        rsize.height = ceil(tmpRect.size.height);
    }
    return rsize;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self _initView];//高用初始化
    }
    return self;
}
-(UIImage *)_getImageFrom:(UIImage *)image rect:(CGRect)rect//对图片进行裁剪
{
    CGImageRef imageref = image.CGImage;
    CGImageRef subimageref =CGImageCreateWithImageInRect(imageref, rect);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, rect, subimageref);
    UIImage *returnimage =[UIImage imageWithCGImage:subimageref];
    UIGraphicsEndImageContext();
    return returnimage;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    NSArray*content = [title componentsSeparatedByString:@":"];
    titlelable.text = content[0];
    detaillable.text = content[1];
    CGSize t = [self _returnContent:titlelable];
    CGSize d = [self _returnContent:detaillable];
    if (status == 1)//表视图全展开
    {
        [imageview setImage:titlepicture];
        imageview.frame = CGRectMake(0, 0, 100, self.contentView.frame.size.height);
        titlelable.frame = CGRectMake(100, 5, t.width, t.height);
        detaillable.frame = CGRectMake(100, 10 + t.height, d.width, d.height);
    }
    else
    {
     UIImage *tq=[self _getImageFrom:titlepicture rect:CGRectMake(0, 0, 100, 30)];
        [imageview setImage:tq];
        imageview.frame = CGRectMake(0, 0, 100, 30);
        titlelable.frame = CGRectMake(100, 5, t.width, 30);
        [detaillable removeFromSuperview];
    }
}
- (void)dealloc {
    [title release];
    [titlepicture release];
    [super dealloc];
}
@end
