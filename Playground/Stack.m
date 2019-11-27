//
//  Stack.m
//  Playground
//
//  Created by Keynes Paul on 11/26/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import "Stack.h"
@interface Stack()
@property(nonatomic,retain) NSMutableArray *stackStorage;
@end

@interface StackWithList ()
@property(nonatomic,retain) DoubleList *stackStorage;
@end
@implementation Stack
-(id)init
{
	if (self == [super init]) {
		self.stackStorage = [NSMutableArray new];
	}
	return self;
}
- (NSUInteger)count {
	return self.stackStorage.count;
}

- (nonnull id)pop {
	id dataToPop = nil;
	if (self.stackStorage.count >=0) {
		dataToPop = [self top];
		[self.stackStorage removeObjectAtIndex:0];
	}
	return dataToPop;
}

- (void)pushwithData:(nonnull id)data {
	[self.stackStorage insertObject:data atIndex:0];
}

- (id)top {
	if (self.stackStorage.count >= 0) {
		return [self.stackStorage objectAtIndex:0];
	}
	return nil;
}

@end

@implementation StackWithList
-(id)init
{
	if (self == [super init]) {
		self.stackStorage = [DoubleList new];
	}
	return self;
}

- (NSUInteger)count {
	return self.stackStorage.count;
}

- (nonnull id)pop {
	return [self.stackStorage deleteNodeAtHead];
}

- (void)pushwithData:(nonnull id)data {
	[self.stackStorage insertNodeAtHeadWithData:data];
}

- (nonnull id)top {
	return [self.stackStorage nodeAtHead];
}

@end
