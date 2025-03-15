module ApiHelpers
    def login_user(user)
        post "/admin/login", params: {
        "admin": {
            "email": admin.email,
            "password": admin.password
        }
    }
    end
end
