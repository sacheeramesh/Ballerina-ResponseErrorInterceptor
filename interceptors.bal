import ballerina/http;

# For custom error
service class ResponseErrorInterceptor {
    *http:ResponseErrorInterceptor;

    remote function interceptResponseError(error err)
                    returns http:InternalServerError|http:Unauthorized|http:BadRequest {

        //error logs 
        // TODO - If there is a database logging function, try here 

        //email alert 
        // TODO - If there is a email alert function, try here

        //Return
        string message = "General error";
        if err is CustomErr {
            CustomErrDetail detail = err.detail();
            message = detail.externalMsg;
            match detail.code {
                http:STATUS_INTERNAL_SERVER_ERROR => {
                    return <http:InternalServerError>{body: {message}};
                }
                http:STATUS_UNAUTHORIZED => {
                    return <http:Unauthorized>{body: {message}};
                }
                http:STATUS_BAD_REQUEST => {
                    return <http:BadRequest>{body: {message}};
                }
            }
        }

        return <http:InternalServerError> {body: {message}};
    }
}
