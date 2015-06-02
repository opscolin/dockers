# About this repository 
  `cell` service is developed by guo haitao to deal with IP package, which province did the given ip come from.

## Docker cell service

### build 
    docker build --rm -t dockercolin/cell:latest .

### environment 
    LANG=en_US.UTF-8
    
### start container
    docker run -d -p 8888:8888 -v /var/catfish/cell:/var/catfish/cell dockercolin/cell:latest 
    
### push 
    docker push dockercolin/cell:latest
    
## Hint
    the folder /var/catfish/cell under host is the root directory of cell service

