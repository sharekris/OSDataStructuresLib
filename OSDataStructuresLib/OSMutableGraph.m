//
//  OSMutableGraph.m
//  OSDataStructuresLib
//
//  Created by Kris Subramanian on 1/22/14.
//
//

#import "OSMutableGraph.h"
#import "OSNodeContext.h"

@implementation OSMutableGraph

- (id) initWithGraphType:(GraphType) graphType
{
    self = [super init];
    if (self)
    {
        _gType = graphType;
        dictionaryOfNodes = [[NSMutableDictionary alloc] init];
        return self;
    }
    
    return nil;
}


- (BOOL) addNode:(OSGraphNode*)graphNode error:(NSError* __autoreleasing *)error
{
    [dictionaryOfNodes setValue:graphNode forKey:graphNode.name];
    return TRUE;
}

- (BOOL) removeNode:(OSGraphNode*)graphNode error:(NSError* __autoreleasing *)error
{
    // This method will find the node, remove it and also remove the edges that this node shares.
    OSGraphNode *node = [dictionaryOfNodes valueForKey:graphNode.name];
    if (node)
    {
        [dictionaryOfNodes removeObjectForKey:graphNode.name];
    }
    return TRUE;
}

- (NSArray*) getAllNodes
{
    return [dictionaryOfNodes allValues];
}

- (OSGraphEdge*) addEdge:(OSGraphNode*)fromNode toNode:(OSGraphNode*)toNode withWeight:(double)weight error:(NSError* __autoreleasing *)error
{
    NSMutableDictionary *dictionaryOfEdges = fromNode.dictionaryOfEdges;
    OSGraphEdge *newEdge = nil;
    if ([dictionaryOfEdges valueForKey:toNode.name])
    {
        *error = [[NSError alloc] initWithDomain:@"Edge already exists" code:1001 userInfo:nil];
        return [dictionaryOfEdges valueForKey:toNode.name];
    }
    
    newEdge = [fromNode addEdgeToNode:toNode withWeight:weight error:error];
    
    if (_gType == UnDirected)
    {
        NSMutableDictionary *dictionaryOfEdges = toNode.dictionaryOfEdges;
        if ([dictionaryOfEdges valueForKey:fromNode.name])
        {
            *error = [[NSError alloc] initWithDomain:@"Edge already exists" code:1001 userInfo:nil];
            return [dictionaryOfEdges valueForKey:fromNode.name];
        }
        
        newEdge = [toNode addEdgeToNode:fromNode withWeight:weight error:error];

    }

    return newEdge;
}

- (OSGraphNode*) nodeByName:(NSString*)name error:(NSError* __autoreleasing *)error
{
    return [dictionaryOfNodes valueForKey:name];
}

- (id) copyWithZone:(NSZone *)zone
{
    OSMutableGraph __autoreleasing *newGraph = [[OSMutableGraph alloc] initWithGraphType:_gType];
    NSError *error = nil;
    // Let us add the nodes first.
    for (OSGraphNode *eachNode in [dictionaryOfNodes allValues])
    {
        OSGraphNode *eachNewNode = [eachNode copy];
        NSError *error = nil;
        [newGraph addNode:eachNewNode error:&error];
    }
    
    // Let us now add the edges.
    for (OSGraphNode *eachNode in [dictionaryOfNodes allValues])
    {
        OSGraphNode *eachNewNode = [newGraph nodeByName:eachNode.name error:&error];
        NSArray *aryOfEdges = eachNode.getAllEdges;
        for (OSGraphEdge *eachEdge in aryOfEdges)
        {
            OSGraphEdge *newEdge = [[OSGraphEdge alloc] init];
            newEdge.fromGraphNode = [newGraph nodeByName:eachEdge.fromGraphNode.name error:&error];
            newEdge.toGraphNode = [newGraph nodeByName:eachEdge.toGraphNode.name error:&error];
            newEdge.weight = eachEdge.weight;
            newEdge.edgeObject = [eachEdge.edgeObject copy];
            
            if (newEdge.fromGraphNode && newEdge.toGraphNode)
            {
                [eachNewNode addEdge:newEdge error:&error];
            }
        }
    }
    
    return newGraph;
}

- (NSArray*) findShortestPathFromNode:(OSGraphNode*)fromNode toNode:(OSGraphNode*)toNode
{
    // The shortest path algorithm is a recursive algorithm that takes a starting node and recursively goes through the entire tree to reach the destination node, each time calculating
    // the cumulative weight along the edges. The shortest path will then be the
    
    if ([fromNode.name isEqualToString:toNode.name])
    {
        return nil;
    }
    
    NSError *error = nil;
    OSGraphNode *startNode = [self nodeByName:fromNode.name error:&error];
    OSGraphNode *endNode = [self nodeByName:toNode.name error:&error];
    
    for (OSGraphNode* eachNode in self.getAllNodes)
    {
        OSNodeContext *aNodeContext = [[OSNodeContext alloc] init];
        
        if ([eachNode.name isEqualToString:fromNode.name])
        {
            aNodeContext.pathWeight = 0.0;
        }
        else
        {
            aNodeContext.pathWeight = MAXFLOAT;
        }
        
        aNodeContext.visited = 0;
        eachNode.nodeContext = aNodeContext;
    }
    
    NSMutableArray *aryOfNodesToVisit = [[NSMutableArray alloc] init];
    [aryOfNodesToVisit addObject:startNode];
    [self performDijkstraAlgorithm:aryOfNodesToVisit toNode:endNode];
    
    // Now check the endNode and the dictionary it holds.
    OSNodeContext *aNodeContext = endNode.nodeContext;

    // If the end node was not even visited, then we have a disconnected graph and so there is no shortest path
    // from the start to end nodes. Return nil.
    if (aNodeContext.visited)
    {
        // Return the path so far that has been collected in the end node.
        return (NSArray*) aNodeContext.pathSoFar;
    }
    
    return nil;
    
}

- (void) performDijkstraAlgorithm:(NSMutableArray*)arrayOfNodesToVisit toNode:(OSGraphNode*) toNode
{
    while ([arrayOfNodesToVisit count] > 0)
    {
        OSGraphNode *fromNode = [arrayOfNodesToVisit objectAtIndex:0];
        [arrayOfNodesToVisit removeObject:fromNode];
        if ([fromNode.name isEqualToString:toNode.name])
        {
            OSNodeContext *toNodeContext = toNode.nodeContext;
            toNodeContext.visited = true;
            toNode.nodeContext = toNodeContext;
            return;
        }
        
        NSError *error = nil;
        // First we compute the weights starting from the fromNode
        NSArray *aryOfEdges = fromNode.getAllEdges;
        OSNodeContext *fromNodeContext = fromNode.nodeContext;
        
        for (OSGraphEdge *eachEdge in aryOfEdges)
        {
            OSNodeContext *toNodeContext = eachEdge.toGraphNode.nodeContext;
            if (toNodeContext.visited)
                continue;
         
            [arrayOfNodesToVisit addObject:eachEdge.toGraphNode];
            double currentNodeWeight = toNodeContext.pathWeight;
            double pathNodeWeight = eachEdge.weight + fromNodeContext.pathWeight;
            
            // If pathWeight is smaller than the current node weight then set the pathweight as the current node weight.
            // Also note down the path so far in an array.
            if (pathNodeWeight < currentNodeWeight)
            {
                toNodeContext.pathWeight = pathNodeWeight;
                
                // The new path that this node will get is basically the Path (all previous edges) collected in the From node + the current edge.
                [toNodeContext.pathSoFar removeAllObjects];
                [toNodeContext.pathSoFar addObjectsFromArray:fromNodeContext.pathSoFar];
                [toNodeContext.pathSoFar addObject:eachEdge];
            }
            
            eachEdge.toGraphNode.nodeContext = toNodeContext;
        }
        
        // Since we are done processing, we should mark this node as visited.
        fromNodeContext.visited = true;
        fromNode.nodeContext = fromNodeContext;
    }
}

@end
