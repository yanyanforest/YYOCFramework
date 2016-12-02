//
//  CYBlock.h
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#ifndef CYBlock_h
#define CYBlock_h


#endif /* CYBlock_h */
typedef id (^CYBlock_id)();
typedef void (^CYBlock_void) ();


#pragma mark  Object blocks - single param of Object

typedef void (^CYBlock_Object) (id obj);

typedef id (^CYBlock_Object_id) (id obj);

typedef void (^CYBlock_Object_Bool) (id obj,BOOL b);

typedef void (^CYBlock_Bool) (BOOL b);
typedef void (^CYBlock_Int) (int obj);

typedef void (^CYBlock_Integer) (NSInteger obj);
typedef void (^CYBlock_ObjectInt) (id obj, NSInteger idx);

#pragma mark NSError blocks

typedef void (^CYBlock_Error) (NSError* error);

typedef void (^CYBlock_ObjectError) (id obj, NSError* error);




typedef void (^CYBlock_ReceiveData_PeerID)(id data , id peerID);


#pragma mark NSArray enumeration blocks

typedef void (^CYBlock_ObjectIndex) (id obj, NSUInteger idx);

typedef void (^CYBlock_ObjectIndexStop) (id obj, NSUInteger idx, BOOL * stop);

typedef id (^CYBlock_ObjectIndex_id) (id obj, NSUInteger idx);

typedef id (^CYBlock_ObjectIndexStop_id) (id obj, NSUInteger idx, BOOL * stop);

typedef void (^CYBlock_Object_State) (id obj, NSUInteger stateCode);

typedef void (^CYBlock_PeerID_DiscoveryInfo) (id peerID, id discoveryInfo);



#pragma mark NSDictionary enumeration blocks

typedef void (^CYBlock_KeyObject) (id key, id obj);

typedef void (^CYBlock_KeyObjectStop)(id key, id obj, BOOL * stop);

typedef id (^CYBlock_KeyObject_id) (id key, id obj);

typedef id (^CYBlock_KeyObjectStop_id)(id key, id obj, BOOL * stop);



typedef void (^CYBlock_ObjectIndexpath) (id obj, NSIndexPath* indexPath);

