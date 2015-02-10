docker pull $container_name && { echo container $container_name upgraded! | wall; } || { echo container $container_name is already up-to-date  | wall;  }
