const { validationResult } = require("express-validator");
const User = require("../models/User");
const profiler = require("../profiler");

module.exports = {
    index: (request, response) => {
        response.render("index", { data: profiler.profiler(request, response)});
    },
    register: async (request, response) => {
        const errors = validationResult(request);
        const getEmail = await User.checkEmail(request.body.email);
        let alert = [{ "type": "error", "msg": [] }];
        
        if(getEmail.length > 0){
            alert[0]["msg"].push({
                "element": "email",
                "message": "This email is already registered"
            });
        }
        
        if(!errors.isEmpty() || request.body.password != request.body.confirm_password){
            errors.array().forEach(value => {
                alert[0]["msg"].push({
                    "element": value.param,
                    "message": value.msg
                });
            });
            if(request.body.password != request.body.confirm_password){
                alert[0]["msg"].push({
                    "element": "confirm_password",
                    "message": "Passwords doesn't match"
                });
            }
        }
        else{
            await User.register(request.body.email, request.body.first_name, request.body.last_name, request.body.password);
            alert = [{"type": "success", "msg": "You're successfully registered"}];
        }
        alert.push(profiler.profiler(request, response));
        response.render("templates/registration_errors", { alert });
    },
    login: async (request, response) => {
        const login = await User.login(request.body.email, request.body.password);
        let message = [];
        if(login.length > 0){
            request.session.user_id = login[0].id;
            request.session.email = login[0].email;
            request.session.first_name = login[0].first_name;
            request.session.last_name = login[0].last_name;

            message[0] = "Success";
        }
        else{
            message[0] = "Incorrect username or password";
        }
        message.push(profiler.profiler(request, response));
        console.log(message);
        response.render("templates/login_error", { message: message });
    },
    profile: (request, response) => {
        if(request.session.user_id != null){
            let user_data = [];
            user_data.push({
                "id": request.session.user_id,
                "email": request.session.email,
                "first_name": request.session.first_name,
                "last_name": request.session.last_name,
            });

            user_data.push(profiler.profiler(request, response));
            console.log(user_data)
            response.render("profile", { data: user_data });
        }
        else{
            response.redirect("/");
        }
    },
    logout: (request, response) => {
        request.session.destroy();
        response.redirect("/");
    }
}