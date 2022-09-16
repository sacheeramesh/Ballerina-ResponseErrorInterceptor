import ballerina/http;
// import ballerina/log;

# Description
service class ResponseErrorInterceptor {
    *http:ResponseErrorInterceptor;

    remote function interceptResponseError(http:RequestContext ctx, http:Response res, error err)
                    returns http:NextService|error? {

        //error logs 
        // log:printError("ResponseErrorInterceptor");
        // io:println("ResponseErrorInterceptor");

        //email alert - TODO

        //Return
        return error("ResponseErrorInterceptor");
    }
}
