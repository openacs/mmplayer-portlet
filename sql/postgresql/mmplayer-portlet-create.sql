
create function inline_0()
returns integer as '
declare
  ds_id portal_datasources.datasource_id%TYPE;
begin

  ds_id = portal_datasource__new(
    ''mmplayer_portlet'',                                               -- Name
    ''MMPlayer portlet''                                                -- description     
  );

  --  the standard 4 params

  -- shadeable_p 
  perform portal_datasource__set_def_param (
        ds_id,                                          -- datasource_id
        ''t'',                                          -- config_required_p
        ''t'',                                          -- configured_p 
        ''shadeable_p'',                        -- key 
        ''t''                                           -- value
);      


  -- hideable_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''hideable_p'',
        ''t''
);      

  -- user_editable_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''user_editable_p'',
        ''f''
);      

  -- shaded_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''shaded_p'',
        ''f''
);      

  -- link_hideable_p 
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''t'',
        ''link_hideable_p'',
        ''t''
);  

-- mmplayer-specific params

  -- community_id must be configured
  perform portal_datasource__set_def_param (
        ds_id,
        ''t'',
        ''f'',
        ''package_id'',
        ''''
);

  return 0;

end;' language 'plpgsql';

select inline_0();

drop function inline_0();


create function inline_1()
returns integer as '
begin

        -- create the implementation
        perform acs_sc_impl__new (
                ''portal_datasource'',
                ''mmplayer_portlet'',
                ''mmplayer_portlet''
        );

        -- add all the hooks
        perform  acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''mmplayer_portlet'',
               ''GetMyName'',
               ''mmplayer_portlet::get_my_name'',
               ''TCL''
        );

        perform  acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''mmplayer_portlet'',
               ''GetPrettyName'',
               ''mmplayer_portlet::get_pretty_name'',
               ''TCL''
        );

        perform  acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''mmplayer_portlet'',
               ''Link'',
               ''mmplayer_portlet::link'',
               ''TCL''
        );

        perform  acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''mmplayer_portlet'',
               ''AddSelfToPage'',
               ''mmplayer_portlet::add_self_to_page'',
               ''TCL''
        );

        perform  acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''mmplayer_portlet'',
               ''Show'',
               ''mmplayer_portlet::show'',
               ''TCL''
        );

        perform  acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''mmplayer_portlet'',
               ''Edit'',
               ''mmplayer_portlet::edit'',
               ''TCL''
        );

        perform  acs_sc_impl_alias__new (
               ''portal_datasource'',
               ''mmplayer_portlet'',
               ''RemoveSelfFromPage'',
               ''mmplayer_portlet::remove_self_from_page'',
               ''TCL''
        );

        -- Add the binding
        perform acs_sc_binding__new (
            ''portal_datasource'',
            ''mmplayer_portlet''
        );

        return 0;
end;' language 'plpgsql';

select inline_1();

drop function inline_1();


\i mmplayer-admin-portlet-create.sql
