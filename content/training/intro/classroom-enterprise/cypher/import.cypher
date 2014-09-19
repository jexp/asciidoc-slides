MATCH n
OPTIONAL MATCH n-[r]->()
DELETE n,r;

LOAD CSV FROM 'persons.csv' AS line
MERGE (p:Person:Entity {name: line[0]});

LOAD CSV FROM 'orgs.csv' AS line
MERGE (o:Org:Dept:Entity {name: line[0]});

LOAD CSV FROM 'depts.csv' AS line
MATCH (d1:Dept {name: line[1]})-[:PARENT*0..]->(o:Org {name: line[2]})
CREATE (d0:Dept {name: line[0]})-[:PARENT]->(d1)
MERGE (p:Person:Entity {name: line[3]})
CREATE (p)<-[:LEAD]-(d0);

LOAD CSV FROM 'depts2.csv' AS line
MATCH (d1:Dept {name: line[1]})-[:PARENT*0..]->(o:Org {name: line[2]})
CREATE (d0:Dept {name: line[0]})-[:PARENT]->(d1)
MERGE (p:Person:Entity {name: line[3]})
CREATE (p)<-[:LEAD]-(d0);

LOAD CSV FROM 'depts-member.csv' AS line
MATCH (d:Dept {name: line[1]})-[:PARENT*0..]->(o:Org {name: line[2]}), (p:Person {name: line[0]})
CREATE h<-[:EMPLOYEE {hoursPerWeek: TOINT(line[3])}]-d;

UNWIND [{city: "Berlin", country: "Germany"}, {city: "Cologne", country: "Germany"}, {city: "Munich", country: "Germany"}, {city: "Bordeaux", country: "France"}, {city: "Vienna", country: "Austria"}, {city: "Paris", country: "France"}] as office
MATCH (o:Org {name: "GraphIT"})
MERGE (city:City {name: office.city})
MERGE (country:Country {name: office.country})
CREATE UNIQUE city-[:IS_IN]->country
CREATE (o)-[:SITE]->(:Office)-[:LOCATION]->(city);

UNWIND [{city: "Rome", country: "Italy"}, {city: "Paris", country: "France"}] as office
MATCH (o:Org {name: "Graphora"})
MERGE (city:City {name: office.city})
MERGE (country:Country {name: office.country})
CREATE UNIQUE city-[:IS_IN]->country
CREATE (o)-[:SITE]->(:Office)-[:LOCATION]->(city);

UNWIND [{city: "Milano", country: "Italy"}, {city: "Cologne", country: "Germany"}, {city: "Paris", country: "France"}] as office
MATCH (o:Org {name: "Graphisto"})
MERGE (city:City {name: office.city})
MERGE (country:Country {name: office.country})
CREATE UNIQUE city-[:IS_IN]->country
CREATE (o)-[:SITE]->(:Office)-[:LOCATION]->(city);

UNWIND [{city: "Madrid", country: "Spain"}] as office
MATCH (o:Org {name: "MyGraph"})
MERGE (city:City {name: office.city})
MERGE (country:Country {name: office.country})
CREATE UNIQUE city-[:IS_IN]->country
CREATE (o)-[:SITE]->(:Office)-[:LOCATION]->(city);

UNWIND [{city: "Berlin", country: "Germany"}] as office
MATCH (o:Org {name: "GraphUniversity"})
MERGE (city:City {name: office.city})
MERGE (country:Country {name: office.country})
CREATE UNIQUE city-[:IS_IN]->country
CREATE (o)-[:SITE]->(:Office)-[:LOCATION]->(city);

MATCH (d:Dept {name: "IT-Department"})-[:PARENT*0..]->(o:Org {name: "GraphIT"}), (p:Person {name: "Charlene"})
CREATE (pr:Project {name: "The next big thing"})-[:BELONGS_TO]->(d)
CREATE (pr)-[:MEMBER {role: "product owner"}]->(p);

MATCH (d:Dept {name: "Mobile Apps"})-[:PARENT*0..]->(o:Org {name: "GraphIT"}), (p:Person {name: "Evan"})
MERGE (pr:Project {name: "Project X"})-[:BELONGS_TO]->(d)
CREATE (pr)-[:MEMBER {role: "product owner"}]->(p);
MATCH (d:Dept {name: "Mobile Apps"})-[:PARENT*0..]->(o:Org {name: "GraphIT"}), (p:Person {name: "Elliot"})
MERGE (pr:Project {name: "Project X"})-[:BELONGS_TO]->(d)
CREATE (pr)-[:MEMBER {role: "developer"}]->(p);
MATCH (d:Dept {name: "Mobile Apps"})-[:PARENT*0..]->(o:Org {name: "GraphIT"}), (p:Person {name: "Emma"})
MERGE (pr:Project {name: "Project X"})-[:BELONGS_TO]->(d)
CREATE (pr)-[:MEMBER {role: "scrum master"}]->(p);
MATCH (d:Dept {name: "Mobile Apps"})-[:PARENT*0..]->(o:Org {name: "GraphIT"}), (p:Person {name: "Evan"})
MERGE (pr:Project {name: "Project Y"})-[:BELONGS_TO]->(d)
CREATE (pr)-[:MEMBER {role: "product owner"}]->(p);
MATCH (d:Dept {name: "Mobile Apps"})-[:PARENT*0..]->(o:Org {name: "GraphIT"}), (p:Person {name: "Elliot"})
MERGE (pr:Project {name: "Project Y"})-[:BELONGS_TO]->(d)
CREATE (pr)-[:MEMBER {role: "scrum master"}]->(p);
