import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
ResponseErrorInterceptor responseErrorInterceptor = new;

@http:ServiceConfig {interceptors: [responseErrorInterceptor]} //check the space with styling guide
service / on new http:Listener(9090) {

    # A resource for generating greetings
    #
    # + option - Parameter Description
    # + return - string name with hello message or error
    resource function get greeting(int option) returns string|error {
        // Send a response back to the caller.
        return check developedFunction(option);

    }
}

function developedFunction(int option) returns string|error {
    if option == 2 {
        return error CustomErr("STATUS_UNAUTHORIZED - original error!", externalMsg = "STATUS_UNAUTHORIZED!",
            code = http:STATUS_UNAUTHORIZED);
    }

    if option == 3 {
        return error CustomErr("STATUS_BAD_REQUEST - original error!", externalMsg = "STATUS_BAD_REQUEST!",
            code = http:STATUS_BAD_REQUEST);
    }

    return error CustomErr("Internal server error - original error!", externalMsg = "Internal server error!",
            code = http:STATUS_INTERNAL_SERVER_ERROR);

}

