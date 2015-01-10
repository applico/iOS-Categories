//
//  NSDictionary+Defaults.m
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "NSDictionary+Defaults.h"

@implementation NSDictionary (defaults)

- (id)objectForKey:(id)aKey withDefaultObject:(id)defaultObject
{
    id object = [self objectForKey:aKey];
    
    if ( object && (object != [NSNull null]) ) {
        return object;
    }
    else {
        return defaultObject;
    }
}

- (id)objectForKeyDefaultsToEmptyString:(id)aKey
{
    return [self objectForKey:aKey withDefaultObject:@""];
}


- (NSString*)stringForKey:(id)aKey withDefaultString:(NSString*)defaultString
{
    id objectForKey = [self objectForKey:aKey withDefaultObject:defaultString];
    
    if ( [objectForKey isKindOfClass:[NSString class]] ) {
        return objectForKey;
    }
    else {
        if ( [objectForKey respondsToSelector:@selector(stringValue)] ) {
            return [objectForKey stringValue];
        }
        else {
            return [objectForKey description];
        }
    }
}

- (NSString*)stringForKeyWithDefaultStringEmptyString:(id)aKey
{
    return [self stringForKey:aKey withDefaultString:@""];
}

@end
