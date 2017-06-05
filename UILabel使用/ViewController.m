//
//  ViewController.m
//  Lab自适应
//
//  Created by object_lan on 2017/5/14.
//  Copyright © 2017年 object_lan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
    [self test2];
    [self test3];
}

//单行宽高自适应
-(void)test1
{
    UILabel *lab = [UILabel new];
    lab.backgroundColor = [UIColor redColor];
    lab.text = @"324324sdsdff!@111,,~^发大发的是...q121313123";
    lab.numberOfLines = 1;
    [self.view addSubview:lab];
    CGRect rect = [lab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : lab.font} context:nil];
    lab.frame = CGRectMake(10, 100, rect.size.width,rect.size.height);
}
//多行高度自适应
-(void)test2
{
    UILabel *lab = [UILabel new];
    lab.backgroundColor = [UIColor redColor];
    lab.text = @"发大发的是的沙发上的风口浪尖上地方都是发的是快乐就是卡德罗夫上地方肯定是龙卷风肯定是落发@#～～@！#¥#@%¥#……%¥&***&&）为僧的方式";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
    CGRect rect = [lab.text boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : lab.font} context:nil];
    lab.frame = CGRectMake(10, 150, 150,rect.size.height);
}
//多样式,富文本
-(void)test3
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"上地方上地方看"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, 2)];
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 2)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(2, 3)];
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(2, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(2, 3)];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(5, 2)];
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(5, 2)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(5, 2)];
    
    //加图片
    //创建图片附件
    NSTextAttachment *attach = [NSTextAttachment new];
    attach.image = [UIImage imageNamed:@"1.png"];
    attach.bounds = CGRectMake(0, 0, 30, 30);
    //创建属性字符串，通过图片附件
    NSAttributedString *attachStr = [NSAttributedString attributedStringWithAttachment:attach];
    
    //拼接字符串
    [str appendAttributedString:attachStr];
    
    //再添加一个字符串
    NSAttributedString *str1 = [[NSAttributedString alloc]
                                initWithString:@"地方绅"
                                attributes:@{NSForegroundColorAttributeName : [UIColor orangeColor],
                                             NSBackgroundColorAttributeName : [UIColor blackColor],
                                             NSFontAttributeName : [UIFont systemFontOfSize:15]}];
    [str appendAttributedString:str1];
    
    //再加一张图片
    //创建图片附件
    NSTextAttachment *attach1 = [NSTextAttachment new];
    attach1.image = [UIImage imageNamed:@"2.png"];
    attach1.bounds = CGRectMake(0, 0, 40, 40);
    //创建属性字符串，通过图片附件
    NSAttributedString *attachStr1 = [NSAttributedString attributedStringWithAttachment:attach1];
    
    //插入字符串
    [str insertAttributedString:attachStr1 atIndex:9];
    
    UILabel *lab = [UILabel new];
    lab.attributedText = str;
    CGRect rect = [lab.attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.frame = CGRectMake(10,400, rect.size.width, rect.size.height);
    [self.view addSubview:lab];
}
@end
