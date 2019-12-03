//
//  Queues.h
//  Playground
//
//  Created by Keynes Paul on 12/2/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol Queue <NSObject>
@required
-(id)dequeue;
-(void)enqueueWithData:(id)data;
-(NSUInteger)count;
-(id)firstElement;
-(id)lastElement;
@end

@interface DynamicQueue : NSObject<Queue>

@end

@interface QueueWithList : NSObject<Queue>

@end

@interface DoubleQueueWithList : QueueWithList<Queue>
-(id)dequeueAtHead;
-(void)enqueueAtTailWithData:(id)data;
@end
NS_ASSUME_NONNULL_END
