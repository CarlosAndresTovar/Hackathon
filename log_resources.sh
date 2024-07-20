#!/bin/bash

echo "Recursos utlizados del contenedor"
echo ""
echo ""
docker stats --no-stream containerHackathon
echo ""
echo ""
docker logs --details containerHackathon