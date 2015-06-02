## Docker Sun Jdk
  Include sun jdk1.7  and jdk1.8

## sun jdk1.7

### build 
    docker build --rm -t dockercolin/sunjdk:1.7.60 .
    
### environment 
    JAVA_HOME=/usr/java/jdk1.7.0_60/
    LANG=en_US.UTF-8
    
## sun jdk1.8

### build 
    docker build --rm -t dockercolin/sunjdk:1.8.40 .
    
### environment
    JAVA_HOME=/usr/java/jdk1.8.0_40/
    LANG=en_US.UTF-8
    
## Push 

    docker push dockercolin/sunjdk:1.7.60
    docker push dockercolin/sunjdk:1.8.40
