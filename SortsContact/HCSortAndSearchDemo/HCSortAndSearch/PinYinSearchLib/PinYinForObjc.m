//
//  PinYinForObjc.m
//  Search
//
//  Created by LYZ on 14-1-24.
//  Copyright (c) 2014年 LYZ. All rights reserved.
//

#import "PinYinForObjc.h"
#import "ChineseInclude.h"
@implementation PinYinForObjc

+ (NSString*)chineseConvertToPinYin:(NSString*)chinese {
    NSString *sourceText = chinese;
    HanyuPinyinOutputFormat *outputFormat = [[HanyuPinyinOutputFormat alloc] init];
    [outputFormat setToneType:ToneTypeWithoutTone];
    [outputFormat setVCharType:VCharTypeWithV];
    [outputFormat setCaseType:CaseTypeLowercase];
    NSString *outputPinyin = [PinyinHelper toHanyuPinyinStringWithNSString:sourceText withHanyuPinyinOutputFormat:outputFormat withNSString:@""];
    
    return outputPinyin;
    
    
}

+ (NSString*)chineseConvertToPinYinHead:(NSString *)chinese {
    HanyuPinyinOutputFormat *outputFormat = [[HanyuPinyinOutputFormat alloc] init];
    [outputFormat setToneType:ToneTypeWithoutTone];
    [outputFormat setVCharType:VCharTypeWithV];
    [outputFormat setCaseType:CaseTypeLowercase];
    NSMutableString *outputPinyin = [[NSMutableString alloc] init];
    for (int i=0;i <chinese.length;i++) {
        //zw 支持中英符号混合！
        if(![ChineseInclude isIncludeChineseInString:[chinese substringWithRange:NSMakeRange(i, 1)]]){
            [outputPinyin appendString:[chinese substringWithRange:NSMakeRange(i, 1)]];
        }else{
            NSString *mainPinyinStrOfChar = [PinyinHelper getFirstHanyuPinyinStringWithChar:[chinese characterAtIndex:i] withHanyuPinyinOutputFormat:outputFormat];
            if (nil!=mainPinyinStrOfChar) {
                [outputPinyin appendString:[mainPinyinStrOfChar substringToIndex:1]];
            } else {
                break;
            }
        }
        
        
    }
    return outputPinyin;
}
@end
