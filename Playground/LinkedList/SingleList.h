//
//  SingleList.h
//  Playground
//
//  Created by Keynes Paul on 11/30/19.
//  Copyright © 2019 com.codeinobjc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef struct Node Node;

struct Node{
	void *data;
	Node *nextNode;
};

@protocol SingleList <NSObject>
@required
-(void)insertNodeWithData:(id)data;
-(Node*)deleteNodeAtHead;
-(BOOL)isEmpty;
-(NSUInteger)count;
-(Node*)searchWithData:(id)data;
@end

@interface SingleList : NSObject<SingleList>
-(id)initWithData:(id)data;
@end

NS_ASSUME_NONNULL_END
