
ad_library {

    Procedures to support the mmplayer portlet

}

namespace eval mmplayer_portlet {

    ad_proc -private get_my_name {
    } {
        return "mmplayer_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "mmplayer-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#mmplayer-portlet.pretty_name#"
    }

    ad_proc -public get_summary_length {
    } {
        return [parameter::get_from_package_key \
                    -package_key [my_package_key] \
                    -parameter mmplayer_portlet_summary_length
        ]
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
        {-param_action:required}
    } {
        Adds a mmplayer PE to the given portal.

        @param portal_id The page to add self to
        @param package_id The community with the folder

        @return element_id The new element's id
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -value $package_id \
            -force_region [parameter::get_from_package_key \
                               -parameter "mmplayer_portlet_force_region" \
                               -package_key [my_package_key]] \
            -pretty_name [get_pretty_name] \
            -param_action $param_action
        ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Removes a mmplayer PE from the given page or the package_id of the
        mmplayer package from the portlet if there are others remaining

        @param portal_id The page to remove self from
        @param package_id
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -value $package_id
    }

    ad_proc -public show {
         cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "mmplayer-portlet"
    }

}
