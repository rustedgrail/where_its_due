// Create people
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/people.csv" AS row
CREATE (:People {deck: row.deck, person_id: row.id, gender: row.gender, giant_bomb_id: row.giant_bomb_id, name: row.name, description: row.description});

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/games.csv" AS row
FOREACH (x IN CASE WHEN row.game_id IS NULL THEN [] ELSE [1] END |
  MERGE (game:Game {game_id: row.game_id, giant_bomb_id: row.giant_bomb_id, image: row.image, name: row.name}) ON CREATE SET game.game_id = row.game_id);

CREATE INDEX ON :People(person_id);
CREATE INDEX ON :Game(game_id);

schema await

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/games.csv" AS row
MATCH (game:Game {game_id: row.game_id})
MATCH (person:People {person_id: row.person_id})
MERGE (person)-[:DEVELOPED]->(game);
