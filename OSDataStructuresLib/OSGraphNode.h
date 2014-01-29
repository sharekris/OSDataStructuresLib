//
//  GraphNode.h
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import <Foundation/Foundation.h>
#import "OSGraphEdge.h"

@class OSGraphEdge;

@interface OSGraphNode : NSObject <NSCopying> {
    // The dictionary of edges is a dictionary that will have the edges as values and the toNode.name as key.
    // That makes it easier to find if a edge exists between the current node and any other given node.
    NSMutableDictionary *dictionaryOfEdges;
    NSString *_name;
    id _nodeObject;
}

@property (nonatomic) NSString* name;
@property (nonatomic) id nodeObject;
@property (nonatomic) id nodeContext;
@property (nonatomic, readonly) NSMutableDictionary *dictionaryOfEdges;

- (OSGraphEdge*) addEdgeToNode:(OSGraphNode*)toNode withWeight:(double)weight error:(NSError* __autoreleasing *)error;
- (NSArray*) getAllEdges;
- (BOOL) addEdge:(OSGraphEdge*) edge error:(NSError* __autoreleasing *)error;
- (id) initWithName:(NSString*) name andNodeObject:(id) obj;

@end
