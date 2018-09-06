//
//  MUtilityMacro.h
//  GrowAlong
//
//  Created by Crazy on 2018/8/10.
//  Copyright © 2018年 no. All rights reserved.
//

#ifndef MUtilityMacro_h
#define MUtilityMacro_h

#pragma mark - ERROR
#define ORIGINAL_ERROR (error.localizedDescription ? : (error.userInfo[@"ErrorMessage"] ? : error.description))
#define ERROR _LS(ORIGINAL_ERROR)


#pragma mark - NSLocalizedString

#define _LS(key)                            NSLocalizedString(key, nil)
#define _LS_T(key, tbl)                     NSLocalizedStringFromTable(key, tbl, nil)
#define _LS_TB(key, tbl, bundle)            NSLocalizedStringFromTableInBundle(key, tbl, bundle, nil)
#define _LS_TBV(key, tbl, bundle, val)      NSLocalizedStringWithDefaultValue(key, tbl, bundle, val, nil)



#pragma mark - const key

#define DECLARE_KEY( key ) FOUNDATION_EXPORT NSString *const key;
#define DEFINE_KEY( key ) NSString *const key = @ #key;
#define DEFINE_KEY_WITH_VALUE( key, property ) NSString *const key = property;


#pragma mark - Shared instance shortcuts
#define APPLICATION [UIApplication sharedApplication]
#define FILE_MANAGER            [NSFileManager defaultManager]
#define MAIN_BUNDLE             [NSBundle mainBundle]
#define MAIN_THREAD             [NSThread mainThread]
#define MAIN_SCREEN             [UIScreen mainScreen]
#define CURRENT_DEVICE          [UIDevice currentDevice]
#define MAIN_RUN_LOOP           [NSRunLoop mainRunLoop]
#define GENERAL_PASTEBOARD      [UIPasteboard generalPasteboard]
#define USER_DEFAULTS           [NSUserDefaults standardUserDefaults]
#define NOTIFICATION_CENTER     [NSNotificationCenter defaultCenter]
#define GUID [[NSProcessInfo processInfo] globallyUniqueString]
#define APP_DELEGATE [[UIApplication sharedApplication] delegate]
#define KEY_WINDOW [APP_DELEGATE window]


#pragma mark - 设备

#define IS_IPHONE ([CURRENT_DEVICE userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPAD ([CURRENT_DEVICE userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define IS_IPHONE_4 (IS_IPHONE && SCREEN_HEIGHT == 480.0f)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_HEIGHT == 568.0f)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_HEIGHT == 667.0f)
#define IS_IPHONE_6p (IS_IPHONE && SCREEN_HEIGHT == 736.0f)


#define DEVICE_MODEL                                [CURRENT_DEVICE model]
#define DEVICE_LOCALIZED_MODEL                      [CURRENT_DEVICE localizedModel]
#define DEVICE_SYSTEM_NAME                          [CURRENT_DEVICE systemName]
#define DEVICE_SYSTEM_VERSION                       [CURRENT_DEVICE systemVersion].floatValue


#ifndef kiOS10Later
#define kiOS10Later (kSystemVersion >= 10)
#endif

#ifndef kiOS11Later
#define kiOS11Later (kSystemVersion >= 11)
#endif

#pragma mark - 相等

#define isEqualIndexPath(indexPath, SECT, ROW) (indexPath.section == SECT && indexPath.row == ROW)

#pragma mark - 机型适配问题
CG_INLINE CGFloat
ratioWidth(width) {
    return floor(width*100/375.0*SCREEN_WIDTH)/100;
}

CG_INLINE CGFloat
ratioHeight(height) {
    return floor(height*100/667.0*SCREEN_HEIGHT)/100;
}

CG_INLINE CGFloat
acceptRatioWidth(width) {
    return SCREEN_WIDTH > 375 ? ratioWidth(width) : width;
}

CG_INLINE CGFloat
acceptRatioHeight(height) {
    return SCREEN_HEIGHT > 667 ? ratioHeight(height) : height;
}


#pragma mark - method
FOUNDATION_EXTERN BOOL isNotEmpty(id val);
FOUNDATION_EXTERN BOOL isEmpty(id val);
FOUNDATION_EXTERN NSArray<NSIndexPath *> * offsetIndexPathsInTableView(NSRange range, NSUInteger section);
FOUNDATION_EXTERN NSArray<NSIndexPath *> * offsetIndexPathsInCollectionView(NSRange range, NSUInteger section);
FOUNDATION_EXTERN CGSize resizeSuchAsAspectRatio(CGSize orignalSize, CGSize ruleSize, BOOL keepOrignalSize);

#pragma mark - GCD
extern dispatch_queue_t DispatchQueueGetForQOS(NSQualityOfService qos);

extern void dispatch_after_on_main_queue(NSTimeInterval delayInseconds, dispatch_block_t block);

extern void dispatch_async_on_background_queueForQOS(NSQualityOfService qos, dispatch_block_t block);

extern void dispatch_async_on_background_queue(dispatch_block_t block);


#define PERFORM_SAFE_BLOCK(block, ...) ((block) ? (block(__VA_ARGS__)) : nil)
#define PERFORM_SAFE_BLOCK_ASYNC_ON_MAIN_QUEUE(block, ...) dispatch_async_on_main_queue(^{ \
PERFORM_SAFE_BLOCK(block, __VA_ARGS__); \
});

#pragma mark - 目录/文件

#define DIR_URL(searchPath)     [[[NSFileManager defaultManager] URLsForDirectory:searchPath inDomains:NSUserDomainMask] lastObject]
#define DIR_PATH(searchPath)    [NSSearchPathForDirectoriesInDomains(searchPath, NSUserDomainMask, YES) lastObject]
#define DIR_PATH_DOC            DIR_PATH(NSDocumentDirectory)
#define DIR_PATH_CACHE          DIR_PATH(NSCachesDirectory)
#define DIR_PATH_LIB            DIR_PATH(NSLibraryDirectory)
#define DIR_PATH_TMP            NSTemporaryDirectory()
#define FILE_PATH_TMP           [DIR_PATH_TMP stringByAppendingPathComponent:GUID]
#define FILE_PATH_CACHE         [DIR_PATH_CACHE stringByAppendingPathComponent:GUID]

#define FILE_EXISTS_AT_PATH(path)   [FILE_MANAGER fileExistsAtPath:path]
#define REMOVE_ITEM_AT_PATH(path)   [FILE_MANAGER removeItemAtPath:path error:nil]


#pragma mark - Resource

#define RES_PATH(filename)                                              [MAIN_BUNDLE pathForResource:filename ofType:nil]
#define RES_PATH_EXT(filename, ext)                                     [MAIN_BUNDLE pathForResource:filename ofType:ext]
#define RES_PATH_EXT_DIR(filename, ext, sub_dir)                        [MAIN_BUNDLE pathForResource:filename ofType:ext inDirectory:sub_dir]
#define RES_PATH_EXT_DIR_LOCALE(filename, ext, sub_dir, localization)   [MAIN_BUNDLE pathForResource:filename ofType:ext inDirectory:sub_dir forLocalization:localization]

#define RES_URL(filename)                                               [MAIN_BUNDLE URLForResource:filename withExtension:nil]
#define RES_URL_EXT(filename, ext)                                      [MAIN_BUNDLE URLForResource:filename withExtension:ext]
#define RES_URL_EXT_DIR(filename, ext, sub_dir)                         [MAIN_BUNDLE URLForResource:filename withExtension:ext subdirectory:sub_dir]
#define RES_URL_EXT_DIR_LOCALE(filename, ext, sub_dir, localization)    [MAIN_BUNDLE URLForResource:filename withExtension:ext subdirectory:sub_dir localization:localization]


#define BUNDLE_INSTACNCE(filename)      [NSBundle bundleWithPath:RES_PATH_EXT(filename, @"bundle")]


#define DUMP_FONT_LIST()  \
NSArray *familyNames = [[UIFont familyNames] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]]];\
NSArray *fonts;\
NSLog(@"Listing all availables fonts : ");\
NSLog(@"-------------------------------");\
for (NSString *familyName in familyNames)\
{\
NSLog(@"%@", familyName);\
fonts = [[UIFont fontNamesForFamilyName:familyName] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]]];\
for (NSString *fontName in fonts)\
NSLog(@"\t\t%@", fontName);\
NSLog(@"\n");\
}\
NSLog(@"-------------------------------");


#pragma mark - 通知

FOUNDATION_EXTERN void NOTIFY(NSString* notiName,id obj,NSDictionary* userinfo);

#define ADD_OBSERVER(notiName, observer, observerSEL, obj) [NOTIFICATION_CENTER addObserver:observer selector:@selector(observerSEL) name:notiName object:obj];
#define REMOVE_OBSERVER(notiName, observer, obj)           [NOTIFICATION_CENTER removeObserver:observer name:notiName object:obj];
#define REMOVE_SELF_OBSERVER                               [NOTIFICATION_CENTER removeObserver:self];

//------------------------------------//

#pragma mark - othter
#define SOUND_SentMessage @"SentMessage"


//---resource---//
#define SHARED_PLACEHOLER_IMAGE [UIImage imageNamed:@"logo_noborder"]

// TODO
#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用下面的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


#endif /* MUtilityMacro_h */
