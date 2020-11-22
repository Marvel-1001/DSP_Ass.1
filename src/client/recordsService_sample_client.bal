public function main (string... args) {

    recordsServiceBlockingClient blockingEp = new("http://localhost:9090");
    hashCode HASHCODE = {Key:hashcode.Key};
        
        var resultFromRead = blockingEp->readRecord(HASHCODE);

        if (resultFromRead is grpc:Error ){

            io:println("Error....");
}


