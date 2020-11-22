import ballerina/grpc;

public type recordsServiceBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function writeRecord(recordInfo req, grpc:Headers? headers = ()) returns ([hashCode, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("recordsService/writeRecord", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<hashCode>result, resHeaders];
        
    }

    public remote function updateRecord(hashCode req, grpc:Headers? headers = ()) returns ([recordInfo, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("recordsService/updateRecord", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<recordInfo>result, resHeaders];
        
    }

    public remote function readRecord(hashCode req, grpc:Headers? headers = ()) returns ([recordInfo, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("recordsService/readRecord", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<recordInfo>result, resHeaders];
        
    }

};

public type recordsServiceClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function writeRecord(recordInfo req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("recordsService/writeRecord", req, msgListener, headers);
    }

    public remote function updateRecord(hashCode req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("recordsService/updateRecord", req, msgListener, headers);
    }

    public remote function readRecord(hashCode req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("recordsService/readRecord", req, msgListener, headers);
    }

};

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



const string ROOT_DESCRIPTOR = "0A0C7265636F72642E70726F746F22A9010A0A7265636F7264496E666F12100A034B657918012001280952034B657912120A046461746518022001280952046461746512220A076172746973747318032003280B32082E4172746973747352076172746973747312120A0462616E64180420012809520462616E64121D0A05736F6E677318052003280B32072E547261636B735205736F6E6773121E0A0A416C62756D7469746C65180620012809520A416C62756D7469746C6522350A074172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280952066D656D62657222500A06547261636B7312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D22370A0868617368436F646512100A034B657918012001280952034B657912190A0876657273696F6E5F180220012803520776657273696F6E3285010A0E7265636F7264735365727669636512250A0B77726974655265636F7264120B2E7265636F7264496E666F1A092E68617368436F646512260A0C7570646174655265636F726412092E68617368436F64651A0B2E7265636F7264496E666F12240A0A726561645265636F726412092E68617368436F64651A0B2E7265636F7264496E666F620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "record.proto":"0A0C7265636F72642E70726F746F22A9010A0A7265636F7264496E666F12100A034B657918012001280952034B657912120A046461746518022001280952046461746512220A076172746973747318032003280B32082E4172746973747352076172746973747312120A0462616E64180420012809520462616E64121D0A05736F6E677318052003280B32072E547261636B735205736F6E6773121E0A0A416C62756D7469746C65180620012809520A416C62756D7469746C6522350A074172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280952066D656D62657222500A06547261636B7312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D22370A0868617368436F646512100A034B657918012001280952034B657912190A0876657273696F6E5F180220012803520776657273696F6E3285010A0E7265636F7264735365727669636512250A0B77726974655265636F7264120B2E7265636F7264496E666F1A092E68617368436F646512260A0C7570646174655265636F726412092E68617368436F64651A0B2E7265636F7264496E666F12240A0A726561645265636F726412092E68617368436F64651A0B2E7265636F7264496E666F620670726F746F33"
        
    };
}
else {
        
               searchedRecord =  resultFromRead[0];
               io:println("*******************************");
                io:println(searchedRecord);
               io:println("*******************************");
               
        }
              //end
