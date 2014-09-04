Basic and self contained samples for scaling options in spring batch. At this time, these samples build with 3.1.0.BUILD-SNAPSHOT to utilize the remote chunking namespace support that will be available in the upcoming 3.1.0 release version. 

The theme to each sample is a user submits images that our job needs to resize. The path to the file is stored in the database, the image on disk residing in the "unprocessed" directory. The job will read the paths from the database and resize the image, writing it to the "processed" directory.

To build all, from the top level directory:

* mvn clean install

Running samples:

* Setup data locations:

  * mkdir -p $HOME/image_submissions/processed

  * mkdir $HOME/image_submissions/unprocessed
  
  * These locations can be changed in either the corresponding application.properties files or overridden by JVM parameters (-Dprop.name=val)

  * Image data obtained from: http://137.189.35.203/WebUI/CatDatabase/catData.html
  
    * Download "part 2" from: http://137.189.35.203/WebUI/CatDatabase/Data/CAT_DATASET_02.zip 
    
    * Extract the archive and move *.jpg into $HOME/image_submissions/unprocessed

Single thread sample

* java -jar single-thread/target/single-thread-1.0.0.BUILD-SNAPSHOT.jar

Multi threaded sample

* java -jar multi-threaded/target/multi-threaded-1.0.0.BUILD-SNAPSHOT.jar

Async processing sample

* java -jar async-process/target/async-process-1.0.0.BUILD-SNAPSHOT.jar

Remote chunking sample:

* Start ActiveMQ locally (or modify the either applications.properties or override via JVM parameters (-Dprop.name=val))

* In separate consoles:

  * java -jar remote-chunking/remote-chunking-slave/target/remote-chunking-slave-1.0.0.BUILD-SNAPSHOT.jar

  * java -jar remote-chunking/remote-chunking-master/target/remote-chunking-master-1.0.0.BUILD-SNAPSHOT.jar

* NOTE: You will probably want to spread these processes over multiple nodes rather than running on a single machine. See application.properties and modifiy or override with JVM parameters (-Dprop.name=val) as appropriate.

Remote partitioning sample:

* Start HSQLDB server:

  * java -cp /path/to/hsqldb-2.3.1.jar org.hsqldb.Server -database.0 file:mydb -dbname.0 partition
  
  * java -jar remote-partitioning/remote-partitioning-slave/target/remote-partitioning-slave-1.0.0.BUILD-SNAPSHOT.jar
  
  * java -jar remote-partitioning/remote-partitioning-master/target/remote-partitioning-master-1.0.0.BUILD-SNAPSHOT.jar 

* NOTE: You will probably want to spread these processes over multiple nodes rather than running on a single machine. Also, you will probably want to use a regular RDBMS. See application.properties and modifiy or override with JVM parameters (-Dprop.name=val) as appropriate.
