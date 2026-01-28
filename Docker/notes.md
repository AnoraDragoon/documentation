# Notes

## Useful commands

Execute and SQL script into postgreSQL docker container

```sh
cat refresh_materialized_views.sql | docker exec -i $(docker ps -q --filter='name=db-hrz') psql -U <db_user> -d <db_name>
```

```sh
docker exec -i $(docker ps -q --filter='name=db-hrz') psql -U greenzone_admin -d greenzone --command $(cat migrate_visit_to_visit_select_for_today.sql)
```

```sh
docker exec -i $(docker ps -q --filter='name=db-hrz') psql -U greenzone_admin -d greenzone --command "CALL inspection.delete_and_insert_visits_hist_by_day(11, 6, 2024);"
```

```sh
docker exec -i $(docker ps -q --filter='name=db-hrz') psql -U greenzone_admin -d greenzone -f refresh_materialized_views.sql
```

```sh
docker logs data_db-hrz_1
```

docker_examples.sh

```sh
docker exec -i data_db-hrz_1 psql -U ${POSTGRESQL_USER_HRZ} -d ${POSTGRESQL_DATABASE_HRZ} "select length(v.raw_data) as jsonb_data_size_kb from inspection.visit v where id = 325465;"

"select length(v.raw_data) as jsonb_data_size_kb from inspection.visit v where id = 325465;" | docker exec -i data_db-hrz_1 psql -U ${POSTGRESQL_USER_HRZ} -d ${POSTGRESQL_DATABASE_HRZ}

cat /opt/crontab/refresh_materialized_views.sql | docker exec -i $(docker ps -q --filter='name=db-hrz') bash -c \"/usr/lib/postgresql/13/bin/psql -U ${POSTGRESQL_USER_HRZ} -d ${POSTGRESQL_DATABASE_HRZ}\" 

cat test_query.sql | docker exec -i $(docker ps -q --filter='name=db-hrz') bash -c /usr/lib/postgresql/13/bin/psql -U greenzone_admin -d greenzone

docker exec -i $(docker ps -q --filter='name=db-hrz') psql -U greenzone_admin -d greenzone --command "CALL inspection.delete_and_insert_visits_hist_by_day(10, 10, 2022);"
cat refresh_materialized_views.sql | docker exec -i $(docker ps -q --filter='name=db-hrz') psql -U greenzone_admin -d greenzone
```

Save Docker Image in a tar.gz

```sh
docker save docker-repos.artifactory.sicpa.com/tt079/tt079-nip-horizon-bus:1.1.0 | gzip > tt079-nip-horizon-bus_1.1.0.tar.gz
```

Load Image saved on a container.

```sh
docker load < tkho-bridge_1.0.5-2.tar.gz
```
