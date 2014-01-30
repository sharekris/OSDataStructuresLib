OSDataStructuresLib
===================

Static library for data structures

This library is intented for Objective-C developers and contains data structures that do not come out of box in Obj-C. 
The first data structure defined is a mutable graph. A graph consists of nodes and edges. The library allows additions
of nodes and edges to a graph. The graph can be connected, disconnected, directed or undirected. 

Nodes and Edges can be defined with a custom object associated with it. This will help associate nodes and edges with 
some application level objects. Edges can have weights associated with it.

Shortest path algorithm is defined on the graph to find the shortest path between any 2 nodes. The output is an array
of edges between 2 given nodes. If the graph is disconnected and there is no direct path between the 2 nodes then a nil
array is returned.

There are more data structures that I want to add to this library. Of course anyone willing to contribute feel free to 
do so. 
