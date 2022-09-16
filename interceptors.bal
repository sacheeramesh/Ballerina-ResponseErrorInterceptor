import ballerina/http;
import ballerina/log;

// import ballerina/log;

// # For error 
// service class ResponseErrorInterceptor {
//     *http:ResponseErrorInterceptor;

//     remote function interceptResponseError(http:RequestContext ctx, http:Response res, error err)
//                     returns http:NextService|error? {

//         //email alert - TODO

//         //Return
//         return err;
//     }
// }

# for custom error
service class ResponseErrorInterceptor {
    *http:ResponseErrorInterceptor;

    remote function interceptResponseError(http:RequestContext ctx, http:Response res, error err)
                    returns http:NextService|http:InternalServerError|http:Unauthorized {

        //error logs 
        log:printError("ResponseErrorInterceptor");

        //email alert - TODO

        //Return
        string message = "General error";
        if err is CustomErr {
            CustomErrDetail detail = err.detail();
            message = detail.externalMsg;

            if detail.code == http:STATUS_INTERNAL_SERVER_ERROR {
                http:InternalServerError e = {body: {message}};
                return e;
            }
            if detail.code == http:STATUS_UNAUTHORIZED {
                http:Unauthorized e = {body: {message}};
                return e;
            }
        }

        http:InternalServerError e = {body: {message}};
        return e;
    }
}
