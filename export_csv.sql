COPY (SELECT * FROM people) TO '/tmp/people.csv' WITH CSV header;

COPY (SELECT * FROM games
      LEFT OUTER JOIN roles ON roles.game_id = games.id where games.id is not null and games.name is not null) TO '/tmp/games.csv' WITH CSV header;
