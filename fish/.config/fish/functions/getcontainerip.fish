function getcontainerip
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' (docker ps --filter "name=$argv[1]" --format '{{.ID}}')
end
