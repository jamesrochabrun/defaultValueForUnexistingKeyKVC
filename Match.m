//
//  Match.m
//  DefaultValueForUnexsitingKeyINJSON
//
//  Created by James Rochabrun on 21-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Match.h"



@implementation Match


-(instancetype)initWitName:(NSString *)local visitorName:(NSString *)visitor local_abbr:(NSString *)local_abbr unexistingKey:(NSString *)unexistingKey {
    self = [super init];
    if(self){
        self.local = local;
        self.visitor = visitor;
        self.local_abbr = local_abbr;
        self.unexistingKey = unexistingKey;
    }
    return self;
}

-(id) valueForUndefinedKey:(NSString *)key {
    NSLog(@"we have no key for %@", key);
    return @"Default value";
}

@end
