//
//  SingleArrayList.m
//  Playground
//
//  Created by Keynes Paul on 11/30/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import "SingleArrayList.h"
@interface SingleArrayList()
@property(nonatomic,retain) NSMutableArray *listStorage;
@end

@implementation SingleArrayList
-(id)initWithData:(id)data
{
	if (self == [super initWithData:data]) {
		self.listStorage = [NSMutableArray new];
	}
	return self;
}

-(void)insertNodeWithData:(id)data
{
//	case 1: list storage is empty
//	case 2: list has one or more elements
	[self.listStorage insertObject:data atIndex:0];
}

-(Node*)deleteNodeAtHead
{
	id dataToDelete = [self.listStorage objectAtIndex:0];
	[self.listStorage removeObjectAtIndex:0];
	return (__bridge Node * _Nonnull)(dataToDelete);
}

-(BOOL)isEmpty
{
	if (self.count > 0) {
		return NO;
	}else{
		return YES;
	}
}

-(NSUInteger)count
{
	return self.listStorage.count;
}

-(Node*)searchWithData:(id)data
{
	__block Node *searchNode = nil;
	[self.listStorage enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		if ([obj isEqual:data]) {
			searchNode = (__bridge Node*)obj;
			*stop = YES;
		}
	}];
	return searchNode;
}
@end
