
create function inline_0 ()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
    from portal_datasources
    where name = ''mmplayer_admin_portlet'';

    if not found then
        raise exception ''No datasource_id found here '',ds_id ;
        ds_id := null;        
    end if;

      
  if ds_id is NOT null then
    perform portal_datasource__delete(ds_id);
  end if;

return 0;

end;' language 'plpgsql';

select inline_0 ();

drop function inline_0 ();

-- create the implementation
select acs_sc_impl__delete (
                'portal_datasource',
                'mmplayer_admin_portlet'
);

-- delete all the hooks
select acs_sc_impl_alias__delete (
               'portal_datasource',
               'mmplayer_admin_portlet',
               'GetMyName'
);

select acs_sc_impl_alias__delete (
               'portal_datasource',
               'mmplayer_admin_portlet',
               'GetPrettyName'
);

select acs_sc_impl_alias__delete (
               'portal_datasource',
               'mmplayer_admin_portlet',
               'Link'
);

select acs_sc_impl_alias__delete (
               'portal_datasource',
               'mmplayer_admin_portlet',
               'AddSelfToPage'
);

select acs_sc_impl_alias__delete (
               'portal_datasource',
               'mmplayer_admin_portlet',
               'Show'
);

select acs_sc_impl_alias__delete (
               'portal_datasource',
               'mmplayer_admin_portlet',
               'Edit'
);

select acs_sc_impl_alias__delete (
               'portal_datasource',
               'mmplayer_admin_portlet',
               'RemoveSelfFromPage'
);

-- Add the binding
select acs_sc_binding__delete (
                'portal_datasource',
                'mmplayer_admin_portlet'
);
