//
//  TryCatch.h
//  LazyCalc
//
//  Created by Дмитрий on 13.08.2020.
//  Copyright © 2020 Дмитрий. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface ObjC : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;

@end
