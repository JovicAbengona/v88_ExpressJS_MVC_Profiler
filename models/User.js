const Config = require("../config");

module.exports = {
    login: (email, password) => {
        return Config.db.any(`SELECT * FROM express_users.users WHERE email = $1 AND password = MD5($2)`, [email, password]);
    },
    register: (email, first_name, last_name, password) => {
        return Config.db.any(`INSERT INTO express_users.users (email, first_name, last_name, password, created_at, updated_at) 
                        VALUES ($1, $2, $3, MD5($4), NOW(), NOW())`, [email, first_name, last_name, password]);
    },
    checkEmail: (email) => {
        return Config.db.any(`SELECT email FROM express_users.users WHERE email = $1`, [email]);
    }
}