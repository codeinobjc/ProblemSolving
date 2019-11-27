//
//  LinkedList.h
//  Playground
//
//  Created by Keynes Paul on 11/22/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinkedList : NSObject

@end
@class Node;

@protocol LinkedList<NSObject>
@required
-(void)insertNodeAtHeadWithData:(id)data;
-(void)insertNodeAtTailWithData:(id)data;
-(void)insertNode:(Node*)node afterData:(id)data;
-(void)insertNode:(Node*)node beforeData:(id)data;
-(Node*)deleteNodeAtHead;
-(Node*)deleteNodeAtTail;
-(Node*)deleteNodeWithData:(id)data;
- (void)printListFromHead:(Node*)headNode;
-(Node*)searchFromHead:(Node*)headNode WithData:(id)data;
-(NSUInteger)count;
-(Node*)nodeAtHead;
@end

@interface Node:NSObject
@end

@interface DoubleNode : Node
@end

@interface DoubleList : Node<LinkedList>
@end

NS_ASSUME_NONNULL_END
