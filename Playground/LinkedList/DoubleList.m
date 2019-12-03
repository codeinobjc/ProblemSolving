//
//  LinkedList.m
//  Playground
//
//  Created by Keynes Paul on 11/22/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import "DoubleList.h"
@interface Node()
@property(nonatomic,retain) id dataToStore;
@end

@interface DoubleNode ()
@property(nonatomic,retain) DoubleNode *nextNode;
@property(nonatomic,retain) DoubleNode *previousNode;
@end

@interface DoubleList()
@property(nonatomic,retain) DoubleNode *headNode,*tailNode;
- (nonnull DoubleNode *)deleteNodeAtHead;
- (nonnull DoubleNode *)deleteNodeAtTail;
-(DoubleNode*)searchFromHead:(DoubleNode*)headNode WithData:(id)data;
- (void)printListFromHead:(DoubleNode*)headNode;
-(NSUInteger)counterWithHead:(DoubleNode*)headNode;
-(DoubleNode*)nodeAtHead;
@end

@implementation Node
@end

@implementation DoubleNode
-(id)initWithData:(id)data
{
	if (self  == [super init]) {
		self.nextNode = nil;
		self.previousNode = nil;
		self.dataToStore = data;
	}
	return self;
}

@end

@implementation DoubleList
-(id)init
{
	if (self == [super init]) {
		self.headNode = nil;
		self.tailNode = nil;
	}
	return self;
}
- (DoubleNode *)deleteNodeAtHead {
//	case 1: head node is nil, return nil
//	case 2: Only one node pointed by head node
//	case 3: There are more than one nodes in the list
	DoubleNode *nodeToDelete = nil;
	if (self.headNode == nil) {
		nodeToDelete = nil;
	}
	if (self.headNode.nextNode == nil) {
		nodeToDelete = self.headNode;
		self.headNode = nil;
		
	}
	if (self.headNode.nextNode != nil) {
			nodeToDelete = self.headNode;
		self.headNode = self.headNode.nextNode;
		self.headNode.previousNode = nil;
	}
	return nodeToDelete;
}

- (DoubleNode *)deleteNodeAtTail {
//	case 1: list is empty
//	case 2: Only one node in the list and pointed by head and tail
//	case 3: More than one node in the list
	DoubleNode *nodeToDelete = nil;
	if (self.tailNode == nil) {
		nodeToDelete = nil;
	}
	if (self.tailNode.previousNode == nil) {
		nodeToDelete = self.tailNode;
		self.tailNode = nil;
	}
	if (self.tailNode.previousNode != nil) {
		nodeToDelete = self.tailNode;
		self.tailNode = self.tailNode.previousNode;
		self.tailNode.nextNode = nil;
	}
	return nodeToDelete;
}

- (DoubleNode *)deleteNodeWithData:(nonnull id)data {
//	case 1: data is not found in the list
//	case 2: list is empty
//	case 3: list has only one node
//	case 4: list has more than one node
	if (self.headNode == self.tailNode) {
		return nil;
	}
	DoubleNode *nodeToDelete = [self searchFromHead:self.headNode WithData:data];
	if ([nodeToDelete isEqual:self.headNode]) {
		[self deleteNodeAtHead];
	}
	if ([nodeToDelete isEqual:self.tailNode]) {
		[self deleteNodeAtTail];
	}
	nodeToDelete.previousNode.nextNode = nodeToDelete.nextNode;
	nodeToDelete.nextNode.previousNode = nodeToDelete.previousNode;
	return nodeToDelete;
}

- (void)insertNode:(nonnull DoubleNode *)node afterData:(nonnull id)data {
//	case 1: list is empty
//	case 2: data is not found
//	case 3: data is at the tail, insert at tail
//	case 4: data is in the middle
	if (self.headNode == self.tailNode) {
		return;
	}
	DoubleNode *searchNode = [self searchFromHead:self.headNode WithData:data];
	if (searchNode == nil) {
		return;
	}
	if (searchNode == self.tailNode) {
		[self insertNodeAtTailWithData:data];
	}
	node.previousNode = searchNode;
	node.nextNode = searchNode.nextNode;
	searchNode.nextNode.previousNode = node;
	searchNode.nextNode = node;
}

- (void)insertNode:(nonnull DoubleNode *)node beforeData:(nonnull id)data {
//	case 1: list is empty
//	case 2: data is not found
//	case 3: data is at the head, insert at head
//	case 4: data is in the middle
	if (self.headNode == self.tailNode) {
		return;
	}
	DoubleNode *searchNode =[self searchFromHead:self.headNode WithData:data];
	if (searchNode == nil) {
		return;
	}
	if (searchNode == self.headNode) {
		[self insertNodeAtHeadWithData:data];
	}
	node.nextNode = searchNode;
	node.previousNode = searchNode.previousNode;
	searchNode.previousNode.nextNode = node;
	searchNode.previousNode = node;
}

- (void)insertNodeAtHeadWithData:(nonnull id)data {
//	case 1: list is empty already
//	case 2: list has more than 1 or more elements
	DoubleNode *nodeToInsert = [[DoubleNode alloc] initWithData:data];
	if (self.headNode == self.tailNode) {
		self.headNode = nodeToInsert;
		self.tailNode = nodeToInsert;
		return;
	}
	nodeToInsert.nextNode = self.headNode;
	self.headNode.previousNode = nodeToInsert;
	self.headNode = nodeToInsert;
}

- (void)insertNodeAtTailWithData:(nonnull id)data {
//	case 1: list is empty
//	cast 2: list has 1 or more elements
	DoubleNode *nodeToInsert = [[DoubleNode alloc] initWithData:data];
	if (self.headNode == self.tailNode) {
		self.tailNode = nodeToInsert;
		self.headNode = nodeToInsert;
		return;
	}
	nodeToInsert.previousNode = self.tailNode;
	self.tailNode.nextNode = nodeToInsert;
	self.tailNode = nodeToInsert;
}

- (void)printListFromHead:(DoubleNode*)headNode {
//	case 1: list is empty
	if (self.headNode == nil) {
		return;
	}
	NSLog(@"%@",self.headNode.dataToStore);
	[self printListFromHead:self.headNode.nextNode];
}

-(Node*)searchFromHeadWithData:(id)data
{
	return [self searchFromHead:self.headNode WithData:data];
}

-(DoubleNode*)searchFromHead:(DoubleNode*)headNode WithData:(id)data {
	DoubleNode *searchNode = nil;
	if (headNode == self.tailNode) {
		return nil;
	}
	[self searchFromHead:headNode.nextNode WithData:data];
	if ([self.headNode.dataToStore isEqual:data]) {
		searchNode = self.headNode;
	}
	return searchNode;
}

-(NSUInteger)count
{
	return [self counterWithHead:self.headNode];
}

- (DoubleNode *)nodeAtHead {
//	case 1: list is emoty, then return nil
//	case 2: list has only one node
//	case 3: list has more than only node
	if (self.headNode == nil) {
		return nil;
	}
	return self.headNode;
}


-(NSUInteger)counterWithHead:(DoubleNode*)headNode
{
	NSUInteger counter=0;
	++counter;
	[self counterWithHead:self.headNode.nextNode];
	return counter;
}

-(DoubleNode*)find:(NSUInteger)data withRootNode:(DoubleNode*)rootNode
{
    //case 1: tree is empty
    //case 2: tree has one node
    //case 3: data is on the left subtree of the root node
    //case 4: data is on the right subtree of the root node
    if(rootNode == nil) return nil;
    if([rootNode.dataToStore isEqual:[NSNumber numberWithInteger:data]])
		return rootNode;
	return [self find:data withRootNode:rootNode.previousNode];
    return [self find:data withRootNode:rootNode.nextNode];
}
@end
