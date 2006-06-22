ad_page_contract {
} {
} -properties {
}

array set config $cf
set shaded_p $config(shaded_p)

set list_of_package_ids $config(package_id)
set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]

set mmplayer_url [ad_conn package_url]
set comm_id [dotlrn_community::get_community_id_from_url -url $mmplayer_url]

if {[exists_and_not_null comm_id]} {
    set root_id [ad_conn node_id]
    set user_id [ad_conn user_id]
    set inside_comm_p 1
} else {
    set inside_comm_p 0
}

ad_return_template

