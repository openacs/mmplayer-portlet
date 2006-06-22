
ad_library {

    Procedures to support the mmplayer admin portlet

}

namespace eval mmplayer_admin_portlet {

    ad_proc -private get_my_name {
    } {
        return "mmplayer_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#mmplayer-portlet.admin_pretty_name#"
    }

    ad_proc -private my_package_key {
    } {
        return "mmplayer-portlet"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-page_name ""}
        {-package_id:required}
    } {
        Adds a mmplayer admin PE to the given portal

        @param portal_id The page to add self to
        @param package_id The package_id of the mmplayer package

        @return element_id The new element's id
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
        ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
    } {
          Removes a mmplayer admin PE from the given page
    } {
        portal::remove_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name]
    }

    ad_proc -public show {
         cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "mmplayer-admin-portlet"

    }

}
