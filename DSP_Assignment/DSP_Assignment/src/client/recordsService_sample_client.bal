import ballerina/grpc;
import ballerina/io;

public function main (string... args) {

    recordsServiceBlockingClient blockingEp = new("http://localhost:9090");
     
        hashCode hashcode= {};

        recordInfo searchedRecord = {};

        recordInfo info = {
            date: "22/10/2020",
            artists: [
                    {
                        name: "Winston Marshall",
                        member: "yes"
                    },
                    {
                        name: "Ben Lovett",
                        member: "yes"
                    },
                    {
                        name: "Baaba Maal",
                        member: "no"
                    }
                ],
            band: "Mumford & Sons",
            songs: [
                    {
                        title: "There will be time",
                        genre: "folk rock",
                        platform: "Deezer"
                    }
                ]
        };

         var result = blockingEp->writeRecord(info);

        if (result is grpc:Error) {

            io:println("Error Occored =>", result);

        } else  {

             hashcode = <hashCode> result[0];

            io:println("The record has been added successfully");

            io:println("HASH KEY : ", hashcode.Key);

        }
      
}



