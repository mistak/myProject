//
//  MInputContentView.h
//  ClientC
//
//  Created by Crazy on 2018/8/9.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MView.h"

typedef NS_ENUM(NSInteger, MInputViewType) {
    MInputViewTypePhone,
    MInputViewTypeVerifyCode,
    MInputViewTypePassWord,
    MInputViewTypeFindPassword_phone,
    MInputViewTypeFindPassword_VerifyCode,
    MInputViewTypeFindPassword_passWord,
    MInputViewTypeEditData_babyName,
    MInputViewTypeEditData_babyAge,
    MInputViewTypeEditData_patriarchIdentity,
    MInputViewTypeEditData_recommendCode
};

@interface MInputContentView : MView

@property(nonatomic, strong) QMUITextField *textField;

@property(nonatomic, strong) MLabel *hintLabel;

@property(nonatomic, assign) NSInteger shortLengthLimit;

@property(nonatomic, assign) NSInteger longLengthLimit;

- (void)setInputType:(MInputViewType)inputType;





+ (CGFloat)heightForType:(MInputViewType)type;

@end
