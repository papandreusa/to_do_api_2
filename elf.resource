=> [32m#<Api::V1::Lib::Serializers::ErrorSerializer:0x00007f3f00353248[0m
 @fieldsets[32m=[0m{},
 @params[32m=[0m{},
 @resource[32m=[0m
  [32m#<Reform::Contract::Result::Errors:0x00007f3f14088e78[0m
   @dotted_errors[32m=[0m{[33m:username[0m=>[[31m[1;31m"[0m[31mmust be unique[1;31m"[0m[31m[0m], [33m:password_confirmation[0m=>[[31m[1;31m"[0m[31mmust be same as password[1;31m"[0m[31m[0m]},
   @form[32m=[0m
    [32m#<Api::V1::Users::Contracts::Create:0x00007f3f00368918[0m
     @_changes[32m=[0m{[31m[1;31m"[0m[31musername[1;31m"[0m[31m[0m=>[1;36mtrue[0m, [31m[1;31m"[0m[31mpassword[1;31m"[0m[31m[0m=>[1;36mtrue[0m, [31m[1;31m"[0m[31mpassword_confirmation[1;31m"[0m[31m[0m=>[1;36mtrue[0m},
     @fields[32m=[0m{[31m[1;31m"[0m[31musername[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31muser8[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31mpassword[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m123452[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31mpassword_confirmation[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m12345[1;31m"[0m[31m[0m},
     @input_params[32m=[0m[32m#<ActionController::Parameters {"username"=>"user8", "password"=>"123452", "password_confirmation"=>"12345", "controller"=>"api/v1/users", "action"=>"create"} permitted: false>[0m,
     @mapper[32m=[0m[32m#<#<Class:0x000055f76d55f388>:0x00007f3f00368828[0m @model[32m=[0m[32m#<User:0x00007f3f00369318[0m id: [1;36mnil[0m, username: [1;36mnil[0m, password_digest: [1;36mnil[0m, created_at: [1;36mnil[0m, updated_at: [1;36mnil[0m[32m>[0m[32m>[0m,
     @model[32m=[0m[32m#<User:0x00007f3f00369318[0m id: [1;36mnil[0m, username: [1;36mnil[0m, password_digest: [1;36mnil[0m, created_at: [1;36mnil[0m, updated_at: [1;36mnil[0m[32m>[0m,
     @result[32m=[0m
      [32m#<Reform::Contract::Result:0x00007f3f1408b498[0m
       @failure[32m=[0m
        [32m#<Dry::Validation::Result{:username=>"user8", :password=>"123452", :password_confirmation=>"12345"} errors={:username=>["must be unique"], :password_confirmation=>["must be same as password"]}>[0m,
       @results[32m=[0m
        [[32m#<Dry::Validation::Result{:username=>"user8", :password=>"123452", :password_confirmation=>"12345"} errors={:username=>["must be unique"], :password_confirmation=>["must be same as password"]}>[0m][32m>[0m[32m>[0m,
   @result[32m=[0m
    [32m#<Reform::Contract::Result:0x00007f3f1408b498[0m
     @failure[32m=[0m
      [32m#<Dry::Validation::Result{:username=>"user8", :password=>"123452", :password_confirmation=>"12345"} errors={:username=>["must be unique"], :password_confirmation=>["must be same as password"]}>[0m,
     @results[32m=[0m
      [[32m#<Dry::Validation::Result{:username=>"user8", :password=>"123452", :password_confirmation=>"12345"} errors={:username=>["must be unique"], :password_confirmation=>["must be same as password"]}>[0m][32m>[0m[32m>[0m[32m>[0m
