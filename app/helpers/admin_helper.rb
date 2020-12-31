module AdminHelper
    def has_avatar_profile
        current_admin.avatar.attached? ? current_admin.avatar : '/templates/admin/horizontal/assets/images/users/avatar-4.jpg'       
    end
end
