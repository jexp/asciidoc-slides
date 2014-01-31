A **Graph Database** stores data in a **Graph**, the most generic of data structures, capable of elegantly representing any kind of data in a highly accessible way. 

The records in a graph database are called **Nodes** .

**Nodes** are connected through typed, directed **Relationships**.

Each single **Node**  and **Relationship** can have named attributes referred to as **Properties**.

A **Label**  is a name that organizes **nodes into groups**.

** **
###Describing a Graph: an Introduction to Cypher
Let's see how we describe elements of a graph using the basic syntax of Cypher, Neo4j's query language.


[Video: What is a Graph? - Nodes](https://vimeo.com/album/2584141/video/77885139)



** **
###Nodes and Relationships
In Neo4j, a graph is comprised of **Nodes** and **Relationships**. In this course we'll be working with a graph about movies. Nodes are used to represent entities like *actors*, *directors* and *movies*. Relationships are used to connect them. So we will have an *ACTED_IN* relationship between *Keanu Reeves* and *The Matrix* and a *DIRECTED* relationship between *Clint Eastwood* and the movie *Unforgiven*.

**Nodes**
`(a) `    actors
`(m)`    movies
`( ) `      some anonymous node

**Relationships**
`-[r]->`                  a relationship referred to as "r"  
`(a)-[r]->(m)`            actors having a relationship referred to as "r" to movies
`-[:ACTED_IN]->`          the relationship type is ACTED_IN
`(a)-[:ACTED_IN]->(m)`    actors that ACTED_IN some movie
`(d)-[:DIRECTED]->(m)`    directors that DIRECTED some movie

** **
###Properties
Both *Nodes* and *Relationships* can have **Properties**. Properties are key:value pairs used to add information about the nodes and relationships. An *actor* might have a *name* property and perhaps another property *born* for their year of birth. A *movie* will probably have a *title*, a *tagline* and a release *date*.

**Nodes with Properties**
`(m {title:"The Matrix"})`                 Movie with a title property
`(a {name:"Keanu Reeves",born:1964})`       Actor with name and born property

**Relationship with Properties**
`(a)-[:ACTED_IN {roles:["Neo"]}]->(m)` Relationship *ACTED_IN* with *roles* property (an array of character names)
** **
###Labels
To allow us to distinguish between different types of nodes, we us **Labels**. Any *Node* can have one or more labels. The obvious choice are labels like *Movie* or *Person*. We might also label *Clint Eastwood* and *Keanu Reeves* as *Actor*, and *Clint Eastwood* also as a *Director*.

**Labels**
`(a:Person)`                                       a Person
`(a:Person  {name:"Keanu Reeves"})`                                       a Person with properties
`(a:Person)-[:ACTED_IN]->(m:Movie)`   a Person that ACTED_IN some movie
