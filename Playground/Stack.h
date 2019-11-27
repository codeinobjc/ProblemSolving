//
//  Stack.h
//  Playground
//
//  Created by Keynes Paul on 11/26/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
NS_ASSUME_NONNULL_BEGIN
@protocol Stack <NSObject>
-(NSUInteger)count;
-(id)top;
-(void)pushwithData:(id)data;
-(id)pop;
@end

@interface Stack : NSObject<Stack>

@end

@interface StackWithList : NSObject<Stack>

@end

NS_ASSUME_NONNULL_END
