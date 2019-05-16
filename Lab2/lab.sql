1.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT * WHERE {
  ?p dbo:birthPlace dbr:Digne-les-Bains.
} 
LIMIT 100

2.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?n WHERE {
  ?p dbo:birthPlace dbr:Digne-les-Bains.
  ?p foaf:name ?n.
} 
LIMIT 100

3.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?n WHERE {
  ?p dbo:birthPlace dbr:Digne-les-Bains.
  ?p foaf:name ?n.
  filter(!CONTAINS(?n,",")).
} 
LIMIT 100

4.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?n ?dn ?dd WHERE {
  ?p dbo:birthPlace dbr:Digne-les-Bains.
  ?p foaf:name ?n.
  filter(!CONTAINS(?n,",")).
  ?p dbo:birthDate ?dn.
  OPTIONAL{?p dbo:deathDate ?dd}.
} 
LIMIT 100

5.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?n ?dn ?dd ?ld WHERE {
  ?p dbo:birthPlace dbr:Digne-les-Bains.
  ?p foaf:name ?n.
  filter(!CONTAINS(?n,",")).
  ?p dbo:birthDate ?dn.
  OPTIONAL{?p dbo:deathDate ?dd}.
  OPTIONAL{?p dbo:deathPlace ?ld}.
} 
LIMIT 100

6.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?p WHERE {
  ?p dbo:country dbr:France.
  ?p dbo:mayor ?m.
  ?m dbo:birthPlace ?p.
} 

7.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?p ?v WHERE {
  ?p dbo:birthPlace ?v.
  ?v dbo:country dbr:France.
} 
LIMIT 100

8.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?v ?m ?d WHERE {
  ?v dbo:mayor ?m.
  ?m dbo:birthDate ?d.
  ?v dbo:country dbr:France.
} 
ORDER BY ?d

9.
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?ville (COUNT(?person) as ?nb_persons) WHERE
{
	?ville dbo:country dbr:France.
  	?person dbo:birthPlace ?ville.
}
GROUP BY ?ville





