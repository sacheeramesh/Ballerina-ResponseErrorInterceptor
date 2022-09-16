import ballerina/http;

# Custom Err Detail
#
# + code - Field Description  
# + externalMsg - Field Description
type CustomErrDetail record {|
    http:STATUS_UNAUTHORIZED|http:STATUS_INTERNAL_SERVER_ERROR|http:STATUS_BAD_REQUEST code;
    string externalMsg;
    
    
|};

# Custom Error
public type CustomErr error<CustomErrDetail>;