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
    if option == 1 {
        return "success response";
    }

    if option == 2 {
        return error CustomErr("Invalid option provided!", externalMsg = "Invalid option provided!",
            code = http:STATUS_UNAUTHORIZED);
    }

    return error CustomErr("Internal server error - original error!", externalMsg = "Internal server error!",
            code = http:STATUS_UNAUTHORIZED);

}

