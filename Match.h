//
//  Match.h
//  DefaultValueForUnexsitingKeyINJSON
//
//  Created by James Rochabrun on 21-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Match : NSObject
@property NSString *local;
@property NSString *visitor;
@property NSString *local_abbr;
@property NSString *unexistingKey;
-(instancetype)initWitName:(NSString *)local visitorName:(NSString *)visitor local_abbr:(NSString *)local_abbr unexistingKey:(NSString *)unexistingKey;
-(id)valueForUndefinedKey:(NSString *)key;

@end
