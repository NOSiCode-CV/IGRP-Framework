curl -u "$K8S_USER:$K8S_TOKEN" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
  'https://manager.nosi.cv/v3/project/c-cpx7p:p-mkpb6/workloads/statefulset:horizon:igrp?action=redeploy'
