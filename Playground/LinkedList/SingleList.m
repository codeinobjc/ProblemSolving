//
//  SingleList.m
//  Playground
//
//  Created by Keynes Paul on 11/30/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import "SingleList.h"

@interface SingleList()
@property(nonatomic,assign) Node *headNode;
@property(nonatomic,assign) NSUInteger *listCount;
-(Node*)searchFromHead:(Node*)headNode WithData:(id)data;
@end

@implementation SingleList
-(id)initWithData:(id)data
{
	if (self == [super init]) {
		(*self.listCount) = 0;
		self.headNode = [self createNodeWithData:data];
	}
	return self;
}
-(Node*)nextNode
{
	if ((*self.headNode).nextNode == nil) {
		return nil;
	}
	return (*self.headNode).nextNode;
}

-(id)init
{
    if(self == [super init])
    {
		self = [self initWithData:@0];
    }
    return self;
}

-(Node*)createNodeWithData:data
{
	Node* newNode = (Node*)malloc(sizeof(Node));
	(*newNode).nextNode = nil;
	(*newNode).data = (__bridge void *)data;
	++(*self.listCount);
    return newNode;
}
-(void)insertNodeWithData:(id)data
{
    //case 1: list is empty
    //case 2: list has one or more nodes
	Node *newNodeToInsertInList = [self createNodeWithData:data];
    if(![self isEmpty])
    {
        (*newNodeToInsertInList).nextNode = self.headNode;
        self.headNode = newNodeToInsertInList;
    }
    self.headNode = newNodeToInsertInList;
}
-(Node*)deleteNodeAtHead
{
    //case 1: list is empty
    //case 2: list has one or more nodes
    Node *nodeToDeleteFromList = nil;
    if(![self isEmpty])
    {
        nodeToDeleteFromList = self.headNode;
		self.headNode = (*self.headNode).nextNode;
    }
    --(*self.listCount);
    return nodeToDeleteFromList;
}
-(BOOL)isEmpty
{
    //case 1: list is empty
    //case 2: list has one or more nodes
    if(self.headNode == nil) return YES;
    return NO;
}
-(NSUInteger)count
{
    return (*self.listCount);
}

-(Node*)searchWithData:(id)data
{
	return [self searchFromHead:self.headNode WithData:data];
}

-(Node*)searchFromHead:(Node*)headNode WithData:(id)data
{
    //case 1: list is empty
    //case 2: list has one or more nodes
    //case 3: data is not found in the list
    if(self.headNode == nil) return self.headNode; //base
	if([(__bridge id)(*self.headNode).data isEqual:data])
	{
		return self.headNode;
	}
	return [self searchFromHead:(*self.headNode).nextNode WithData:data];
}
@end
