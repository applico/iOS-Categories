//
//  NSDictionary+Defaults.h
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (defaults)

- (id)objectForKey:(id)aKey withDefaultObject:(id)defaultObject;

- (id)objectForKeyDefaultsToEmptyString:(id)aKey;

- (NSString*)stringForKey:(id)aKey withDefaultString:(NSString*)defaultString;

- (NSString*)stringForKeyWithDefaultStringEmptyString:(id)aKey;

@end
