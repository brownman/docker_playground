machine:
  services:
    - docker
    
  environment:   
    timeout: 600
    alias: onbuild
    prefix: 
    CONTAINER:       brownman/$alias
    container_path:  ./languages/$prefix/$alias
    file_test:       $container_path/test.sh
    dir_cache:       $HOME/docker
    file_cache:      $dir_cache/${alias}.tar

dependencies:
  override:
    - docker images | wc -l
    - if [[ -e $file_cache ]]; then echo using cache; docker load -i $file_cache; else echo no cache; fi
    - docker build -t $CONTAINER $container_path:
        timeout: 600
    - mkdir -p $dir_cache; docker save $CONTAINER > $file_cache
    - docker info
    - docker images | wc -l

 # cache_directories:
#    - $dir_cache
    
test:
  override:
    - docker run -it brownman/gitlab bash -c 'ls -l $HOME'
    - docker run -i $CONTAINER bash < $container_path/test.sh
#else:
#    - docker run -it brownman/apt bash -c 'ls -l $HOME'
#    - docker run -it brownman/user bash -c 'ls -l $HOME'
#    - docker run -it brownman/bashrc bash -c 'ls -l $HOME'
#    - docker run -it brownman/mongo bash -c 'ls -l $HOME'
#    - docker run -it brownman/nvm bash -c 'ls -l $HOME'
#    - docker run -it brownman/rbenv bash -c 'ls -l $HOME'
#    - docker run -it brownman/onbuild bash -c 'ls -l $HOME'

# - docker run --name some-mongo -d mongo && 
#   - docker run -i $CONTAINER bash -c 'ls $HOME'
#< $file_test;
#- chmod +x ./test_linking.sh && ./test_linking.sh
#1>$CIRCLE_ARTIFACTS/test1.out.txt 2>$CIRCLE_ARTIFACTS/test1.err.txt
# - echo env |  docker run -i -t $CONTAINER bash -c


    
  
