Samples for scaling options in spring batch. At this time, these samples require 3.1.0.BUILD-SNAPSHOT or greater. 

To build all, from the top level directory:

* mvn clean install

Running samples:

* Setup data locations:

  * mkdir -p $HOME/image_submissions/processed

  * mkdir $HOME/image_submissions/unprocessed

  * Extract image data from FIND_HOME into $HOME/image_submissions/unprocessed

Single thread sample

* java -jar single-thread/target/single-thread-1.0.0.BUILD-SNAPSHOT.jar

Multi threaded sample

* java -jar multi-threaded/target/multi-threaded-1.0.0.BUILD-SNAPSHOT.jar

Async processing sample

* java -jar async-process/target/async-process-1.0.0.BUILD-SNAPSHOT.jar

Remote chunking sample:

* Start ActiveMQ locally (or modify the property file and set the proper broker URL) 

* In separate consoles:

  * java -jar remote-chunking/remote-chunking-slave/target/remote-chunking-slave-1.0.0.BUILD-SNAPSHOT.jar

  * java -jar remote-chunking/remote-chunking-master/target/remote-chunking-master-1.0.0.BUILD-SNAPSHOT.jar

* See the remote-chunking/remote-chunking-slave/bin directory for some basic scripts on starting / stopping slaves

* You will want to spread these processes over multiple nodes rather than running on a single machine and modify the configuration files appropriately.

Remote partitioning sample:

* Add me

