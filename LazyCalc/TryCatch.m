//
//  TryCatch.m
//  LazyCalc
//
//  Created by Дмитрий on 13.08.2020.
//  Copyright © 2020 Дмитрий. All rights reserved.
//

#import "TryCatch.h"

@implementation ObjC

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error {
    @try {
        tryBlock();
        return YES;
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.name code:0 userInfo:exception.userInfo];
        return NO;
    }
}

@end
