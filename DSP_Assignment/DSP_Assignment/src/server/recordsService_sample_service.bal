import ballerina/crypto;
import ballerina/grpc;
import ballerina/io;
// import ballerina/log;

listener grpc:Listener ep = new (9090);

// map<recordInfo> Songs = {};

recordInfo[] SongList = [];

service recordsService on ep {

    resource function writeRecord(grpc:Caller caller, recordInfo value) {
        // Implementation goes here.
        byte[] hash = [];
        byte[] data = [];
        boolean recExists =  false;
        int songLength = SongList.length();


            string songHASH = value.toString();
            byte[] hashByte = songHASH.toBytes();
            byte[] HASH = crypto:hashMd5(hashByte);
            value["Key"] = HASH.toBase16();

            string hashString =  value["Key"];
            hashCode myHashKey = {Key:hashString};

            io:println("Encryption with hashMd5: " + myHashKey.Key);
            grpc:Error? result = caller->send(myHashKey);

            if (result is grpc:Error) {

                io:println("HashCode failed because " + result.reason().toString());
            
                result = caller->complete();

            } else {

                    foreach recordInfo song in SongList {
                        if (song.Key == myHashKey.Key) {
                            result = caller->sendError(404, "Record Already Exists [!]");
                            recExists = true;
                            break;
                        }
                    }

                    if (!recExists) {

                SongList.push(value);
                
                    }

            }
        
                result = caller->complete();
    // You should return a hashCode
    }

    resource function updateRecord(grpc:Caller caller, hashCode value) {
    // Implementation goes here.




    // You should return a recordInfo
    }
    resource function readRecord(grpc:Caller caller, hashCode value) {

    // Implementation goes here.

    
    // You should return a recordInfo
    }
}

public type recordInfo record {|
    string Key = "";
    string date = "";
    Artists[] artists = [];
    string band = "";
    Tracks[] songs = [];
    string Albumtitle = "";
    
|};

public type Artists record {|
    string name = "";
    string member = "";
    
|};

public type Tracks record {|
    string title = "";
    string genre = "";
    string platform = "";
    
|};

public type hashCode record {|
    string Key = "";
    int version_ = 0;
    
|};



const string ROOT_DESCRIPTOR = "0A0D7265636F7264732E70726F746F22A9010A0A7265636F7264496E666F12100A034B657918012001280952034B657912120A046461746518022001280952046461746512220A076172746973747318032003280B32082E4172746973747352076172746973747312120A0462616E64180420012809520462616E64121D0A05736F6E677318052003280B32072E547261636B735205736F6E6773121E0A0A416C62756D7469746C65180620012809520A416C62756D7469746C6522350A074172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280952066D656D62657222500A06547261636B7312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D22370A0868617368436F646512100A034B657918012001280952034B657912190A0876657273696F6E5F180220012803520776657273696F6E3285010A0E7265636F7264735365727669636512250A0B77726974655265636F7264120B2E7265636F7264496E666F1A092E68617368436F646512260A0C7570646174655265636F726412092E68617368436F64651A0B2E7265636F7264496E666F12240A0A726561645265636F726412092E68617368436F64651A0B2E7265636F7264496E666F620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "records.proto":"0A0D7265636F7264732E70726F746F22A9010A0A7265636F7264496E666F12100A034B657918012001280952034B657912120A046461746518022001280952046461746512220A076172746973747318032003280B32082E4172746973747352076172746973747312120A0462616E64180420012809520462616E64121D0A05736F6E677318052003280B32072E547261636B735205736F6E6773121E0A0A416C62756D7469746C65180620012809520A416C62756D7469746C6522350A074172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280952066D656D62657222500A06547261636B7312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D22370A0868617368436F646512100A034B657918012001280952034B657912190A0876657273696F6E5F180220012803520776657273696F6E3285010A0E7265636F7264735365727669636512250A0B77726974655265636F7264120B2E7265636F7264496E666F1A092E68617368436F646512260A0C7570646174655265636F726412092E68617368436F64651A0B2E7265636F7264496E666F12240A0A726561645265636F726412092E68617368436F64651A0B2E7265636F7264496E666F620670726F746F33"
        
    };
}

