//
//  Queues.m
//  Playground
//
//  Created by Keynes Paul on 12/2/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import "Queues.h"
#import "DoubleList.h"

@interface DynamicQueue()
@property(nonatomic,retain) NSMutableArray *queueStorage;
@end

@interface QueueWithList()
@property(nonatomic,retain) DoubleList *queueStorage;
@end

@implementation DynamicQueue
-(id)init{
	if (self == [super init]) {
		self.queueStorage = [NSMutableArray new];
	}
	return self;
}
- (NSUInteger)count {
	return self.queueStorage.count;
}

- (nonnull id)dequeue {
	id dataToDequeue = [self firstElement];
	[self.queueStorage removeObjectAtIndex:0];
	return dataToDequeue;
}

- (void)enqueueWithData:(nonnull id)data {
	[self.queueStorage addObject:data];
}

- (nonnull id)firstElement {
	return [self.queueStorage firstObject];
}

- (nonnull id)lastElement {
	return [self.queueStorage lastObject];
}

@end

@implementation QueueWithList
-(id)init{
	if (self == [super init]) {
		self.queueStorage = [DoubleList new];
	}
	return self;
}
- (NSUInteger)count {
	return self.queueStorage.count;
}

- (nonnull id)dequeue {
	return [self.queueStorage deleteNodeAtTail];
}

- (void)enqueueWithData:(nonnull id)data {
	[self.queueStorage insertNodeAtHeadWithData:data];
}

- (nonnull id)firstElement {
	return [self.queueStorage nodeAtHead];
}

- (nonnull id)lastElement {
	return nil;
}
@end

@implementation DoubleQueueWithList

-(id)init{
	if (self == [super init]) {
		self.queueStorage = [DoubleList new];
	}
	return self;
}
- (NSUInteger)count {
	return [super count];
}

- (nonnull id)dequeue {
	return [super dequeue];
}

- (void)enqueueWithData:(nonnull id)data {
	[super enqueueWithData:data];
}

- (nonnull id)firstElement {
	return [super firstElement];
}

- (nonnull id)lastElement {
	return [super lastElement];
}

-(id)dequeueAtHead {
	return [self.queueStorage deleteNodeAtHead];
}

-(void)enqueueAtTailWithData:(id)data {
	[self.queueStorage insertNodeAtTailWithData:data];
}

@end
